
package com.teamproject.trackers.view.product;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.teamproject.trackers.biz.common.AlertVO;
import com.teamproject.trackers.biz.drive.DriveController;
import com.teamproject.trackers.biz.product.CreatorListVO;
import com.teamproject.trackers.biz.product.ProductPageVO;
import com.teamproject.trackers.biz.product.ProductListVO;
import com.teamproject.trackers.biz.product.categoryDetail.DesignCategoryVO;
import com.teamproject.trackers.biz.product.categoryDetail.PageCategoryVO;
import com.teamproject.trackers.biz.product.categoryDetail.ProductDetailVO;
import com.teamproject.trackers.biz.reviewInquiry.InquiryRepository;
import com.teamproject.trackers.biz.reviewInquiry.InquiryService;
import com.teamproject.trackers.biz.reviewInquiry.ReviewService;
import com.teamproject.trackers.biz.product.ProductService;
import com.teamproject.trackers.biz.product.ProductVO;
import com.teamproject.trackers.biz.product.categoryDetail.DesignCategoryVO;
import com.teamproject.trackers.biz.product.categoryDetail.PageCategoryVO;
import com.teamproject.trackers.biz.product.categoryDetail.ProductDetailVO;

import lombok.RequiredArgsConstructor;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
//----------------정희 추가-----------------
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;


@Controller
@RequiredArgsConstructor
@RequestMapping("/store")
public class ProductController {

	
    private ProductService productService;
    private ReviewService reviewService;
    private InquiryService inquiryService;
    private HttpSession session;
	private DriveController drive;
		
    @Autowired
	public ProductController(
			ProductService productService, ReviewService reviewService, InquiryService inquiryService,
			HttpSession session, DriveController drive) {
		this.productService = productService;
		this.reviewService = reviewService;
		this.inquiryService = inquiryService;
		this.session = session;
		this.drive = drive;
	}
	
	
	
	
    ////* 스토어 메인 띄우기 *////
    @RequestMapping(value="/main", method=RequestMethod.GET)
    public String stMain(Model model) {
    	
    	List<CreatorListVO> b_creators = productService.getBestCreator();
    	List<ProductVO> b_signatures = new ArrayList<ProductVO>();
    	for(CreatorListVO c : b_creators) {			// 대표상품 저장
    		b_signatures.add(productService.getBestSignature(c.getId()));
    	}
    	
    	model.addAttribute("b_products", productService.getBestProduct());		// 베스트 상품 최대 5개
    	model.addAttribute("r_products", productService.getRecentProduct());	// 최신 상품 최대 5개
    	model.addAttribute("b_creators", b_creators);							// 인기 크리에이터 최대 5명
    	model.addAttribute("b_signatures", b_signatures);						// 인기 크리에이터 대표상품
    	    	
    	return "store/st-main";
    }
    
	////* main 없이 입력할 경우에도 스토어 메인 띄우기 *////
	@RequestMapping(value="", method=RequestMethod.GET)
	public String stMain2() {
		return "redirect:/store/main";
	}

	////* 상품 상세 조회 *////
	@RequestMapping(value="/products/{p_id}", method=RequestMethod.GET)
	public String getProduct(@PathVariable("p_id") String p_id, Model model) throws Exception {
		System.out.println("p_id: "+p_id);
		
		ProductPageVO product = productService.getProductPage(Long.parseLong(p_id));
		
		if(product == null) {
			// 해당 id의 상품이 존재하지 않는 경우
			throw new Exception("존재하지 않는 상품입니다");
		}
		
		model.addAttribute("product", product);	
		model.addAttribute("reviews", reviewService.getProductReviewList(Long.parseLong(p_id)));
		model.addAttribute("inquiries", inquiryService.getInquiryList(Long.parseLong(p_id)));
		
		return "store/st-product-single";
	}
	
	////* 상품 상세 조회 JSON *////
	@RequestMapping(value="/products/price/{p_id}", method=RequestMethod.GET)
	@ResponseBody
	public ProductPageVO getProductPrice(@PathVariable("p_id") String p_id, Model model) throws Exception {
		ProductPageVO product = productService.getProductPage(Long.parseLong(p_id));
		
		if(product == null) {
			// 해당 id의 상품이 존재하지 않는 경우
			throw new Exception("존재하지 않는 상품입니다");
		}
		
		int final_price = product.getPrice()-product.getSale();		
		return product;
	}
	
	
	
	////* 상품 리스트 조회 *////
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public String getProductList(String category, int page, String keyword, String sort, Model model) {
		
		// 정렬 및 페이징 , 검색 처리
		Page<ProductListVO> list = null;
		Pageable pageable = null;
		
		if(!category.equals("all")) {
			// 정렬
			if(sort.equals("creDate")) {
				pageable = PageRequest.of(page, 9, Sort.by(Sort.Direction.DESC, "cre_date"));
			}else if(sort.equals("highprice")) {
				pageable = PageRequest.of(page, 9, Sort.by(Sort.Direction.DESC, "sale_price"));
			}else if(sort.equals("lowprice")) {
				pageable = PageRequest.of(page, 9, Sort.by(Sort.Direction.ASC, "sale_price"));
			}else {
				pageable = PageRequest.of(page, 9, Sort.by(Sort.Direction.DESC, sort));	// 시작 페이지, 데이터 개수, 정렬 기준
			}
			
			// 검색 x 경우
			if(keyword == null) keyword="";
			
			list = productService.getCategorList(category, keyword, pageable);
		}else {
			// 정렬
			if(sort.equals("highprice")) {
				pageable = PageRequest.of(page, 9, Sort.by(Sort.Direction.DESC, "salePrice"));
			}else if(sort.equals("lowprice")) {
				pageable = PageRequest.of(page, 9, Sort.by(Sort.Direction.ASC, "salePrice"));
			}else {
				pageable = PageRequest.of(page, 9, Sort.by(Sort.Direction.DESC, sort));
			}
			
			// 검색
			if(keyword != null) {			// 검색 o
				list = productService.getSearchProductList(keyword, pageable);
			}else {							// 검색 x
				keyword = "";
				list = productService.getProductList(pageable);	
			}
		}
		
		int nowPage = list.getPageable().getPageNumber()+1;			// 현재 페이지, 0부터 시작하므로 +1
		int startPage = Math.max(nowPage-4, 1);						// 시작 페이지 번호
		int endPage = Math.min(nowPage+5, list.getTotalPages());	// 끝 페이지 번호
		
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("products", list);
		model.addAttribute("sort", sort);
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		
		return "/store/st-products";
	}

	
	
	
	
	
	
	
	////* 상품 관리 페이지 띄우기 (판매자별 상품 목록) *////
	//------------------------------------------------------정희
	// 상품 관리 페이지 띄우기
    @GetMapping("/products/management")
    public String showProductManagement(Model model, HttpSession session) {
        // 현재 로그인한 판매자의 아이디를 세션에서 가져옴
    	Long id = (Long) session.getAttribute("id");

    	// 세션에 "id"라는 속성이 없는 경우 예외 처리
        if (id == null) {
            // 로그인이 되어있지 않으므로 로그인 페이지로 이동하거나 다른 처리를 수행해야 할 수 있음
            // 예를 들면, 로그인 페이지로 리다이렉트하려면 아래와 같이 처리할 수 있습니다.
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        // 판매자의 상품 리스트 조회 (현재 판매자가 등록한 상품들만 조회)
        List<ProductVO> productList = productService.getProductListBySellerId(id);

        // 서버로부터 삭제된 상품 ID 목록을 받아옴
        List<Long> deletedProductIds = productService.getDeletedProductIds();

        // 삭제된 상품 ID 목록을 JSP에 전달하여 숨겨진 상품 처리를 위해 JavaScript에서 사용
        model.addAttribute("deletedProductIds", deletedProductIds);
        model.addAttribute("productList", productList);

        return "my-store/product-management";
    }
    //------------------------------------------------------정희
	
    
    ////* 상품 등록 페이지 띄우기 *////
	@RequestMapping(value="/products/new", method=RequestMethod.GET)
    public String showProductForm() {
        return "my-store/insert-product";
    }
    
	////* 상품 등록 처리 *////
	@RequestMapping(value="/products", method=RequestMethod.POST)
	@Transactional
	public String insertProduct(ProductVO vo, HttpServletRequest req, 
			@RequestParam MultipartFile thumbnail_f, 
			@RequestParam MultipartFile file_f, 
			@RequestParam("category_design") List<String> design,
			@RequestParam("category_page") List<String> page,
			@RequestParam String content) throws Exception {

		System.out.println("insertProduct() 실행");
		
		String thumbnail = null;
		String file = null;
		
		// 썸네일 저장
		if(!thumbnail_f.isEmpty()) {
			thumbnail = saveFile(thumbnail_f, "thumbnail/", req);
			//System.out.println("저장된 thumbnail: "+thumbnail);
		}
		
		// 파일 구글드라이브 저장
		if(!file_f.isEmpty()) {
			//file = drive.uploadProductFile(file_f);
			file = saveFile(file_f, "file/", req);
			// 일단 일반 폴더에 저장
			System.out.println("저장된 file: "+file);
		}

		
		// ProductVO 저장
		long id = (long)session.getAttribute("id");
		vo.setId(id);
		vo.setThumbnail(thumbnail);
		vo.setFile(file);
		
		// 현재 날짜 저장
		LocalDate now = LocalDate.now();
		vo.setCreDate(Date.valueOf(now));
		
		// 상품 등록 로직
		productService.insertProduct(vo);
		
		// 방금 저장된 상품 p_id 가져오기
		ProductVO last = productService.getProductByFile(file);
		long p_id = last.getPid();

		// 카테고리 저장
		DesignCategoryVO designVO = prepareDesignCategory(p_id, design);
		insertDesignCategory(designVO);
		
		PageCategoryVO pageVO = preparePageCategory(p_id, page);
		insertPageCategory(pageVO);
		
        // ProductDetails 저장
        insertProductDetail(p_id, content);
        

        return "redirect:/store/products/management";
    }

	
	////* 썸네일 저장 로직  *////
	// 임시로 파일도 일단 여기에 저장함
    private String saveFile(MultipartFile file, String type, HttpServletRequest req) throws IllegalStateException, IOException {
    	
    	String tmpPath = req.getServletContext().getRealPath("/resources/productfile/");		// 위치 생각해 볼 것
    	
    	String originalName = file.getOriginalFilename();       
        long now = System.currentTimeMillis(); 
        String fileName = now+"-"+originalName;		// 저장되는 파일 이름	
        
		File uploadFile = new File(tmpPath+type+fileName);
		file.transferTo(uploadFile);
		
        // 파일 저장하고 파일명 반환
        return "/resources/productfile/"+type+fileName;
    }
    
    
    
    
    ////* 상품 카테고리 객체준비 - 디자인 *////
    private DesignCategoryVO prepareDesignCategory(long p_id, List<String> design) {
    	DesignCategoryVO vo = new DesignCategoryVO();   
    	vo.setPid(p_id);
    	if(design!=null) {   		
	    	for(String s : design) {
	    		System.out.println("design s: "+s);
	    		switch (s) {
				case "minimal":
					vo.setMinimal(true);
					break;
				case "illustration":
					vo.setIllustration(true);
					break;
				case "photo":
					vo.setPhoto(true);
					break;
				}
	    	}   	
    	} else {
    		
    	}
    	return vo;
    }
    
    ////* 상품 카테고리 객체준비 - 페이지 *////
    private PageCategoryVO preparePageCategory(long p_id, List<String> page) {
    	PageCategoryVO vo = new PageCategoryVO();    	
		vo.setPid(p_id);
		if(page!=null) {   		
	    	for(String s : page) {
	    		System.out.println("page s: "+s);
	    		switch (s) {
				case "whole":
					vo.setWhole(true);
					break;
				case "monthly":
					vo.setMonthly(true);
					break;
				case "weekly":
					vo.setWeekly(true);
					break;
				case "habit":
					vo.setHabit(true);
					break;
				case "mood":
					vo.setMood(true);
					break;
				case "reading":
					vo.setReading(true);
					break;
				case "expense":
					vo.setExpense(true);
					break;
				case "study":
					vo.setStudy(true);
					break;
				case "sticker":
					vo.setSticker(true);
					break;
				case "etc":
					vo.setEtc(true);
					break;
				}
	    	}  
		}
    	return vo;
    }
    
    
    
    ////* 상품 카테고리 등록 - 디자인 *////
    private void insertDesignCategory(DesignCategoryVO vo) {
    	productService.insertDesignCategory(vo);
    }
    
    ////* 상품 카테고리 등록 - 페이지 *////
    private void insertPageCategory(PageCategoryVO vo) {
    	productService.insertPageCategory(vo);    	
    }
    
    
    
    ////* 상품 detail 등록 */////
    private void insertProductDetail(long p_id, String content) {
    	ProductDetailVO detail = new ProductDetailVO();
    	detail.setPid(p_id);
    	detail.setImg(content);
    	
    	productService.insertProductDetail(detail);
    }
    
    
    
    
    ////* 상품 detail 이미지파일 저장 *////
    @RequestMapping(value="/products/detail", method=RequestMethod.POST)
    public void saveDetailFile(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		
    	req.setCharacterEncoding("utf-8");
    	resp.setContentType("text/html;charset=utf-8");
    	
    	JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() > 0 && file.getName().length() > 0) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/productfile/detail/"); //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/resources/productfile/detail/" +fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}			
			}		
		}
	}
	
	
    /*
    @RequestMapping(value="/products/detail", method=RequestMethod.POST)
	public void saveDetailFile(HttpServletRequest request,HttpServletResponse response, MultipartFile upload) throws Exception {
		
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
 
        //파일 이름 가져오기
        String fileName=upload.getOriginalFilename();
 
        //파일을 바이트 배열로 변환
        byte[] bytes=upload.getBytes();
 
        //이미지를 업로드할 디렉토리를 정해준다
        String uploadPath="C:\\Users\\eclipse-workspace\\test\\src\\main\\webapp\\ckEimg\\";
        OutputStream out=new FileOutputStream(new File(uploadPath+fileName));
 
        //서버에 write
        out.write(bytes);
        
        //성공여부 가져오기
        String callback=request.getParameter("CKEditorFuncNum");
        
        //클라이언트에 이벤트 추가 (자바스크립트 실행)
        PrintWriter printWriter=response.getWriter(); //자바스크립트 쓰기위한 도구
 
        String fileUrl= request.getContextPath()+"/ckEimg/"+fileName;
       
        if(!callback.equals("1")) { // callback이 1일 경우만 성공한 것
        	 printWriter.println("<script>alert('이미지 업로드에 실패했습니다.');"+"</script>");

        }else {
        	 logger.info("upload img 들어온다! "+fileUrl);
             
             printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
             
        }
        
        printWriter.flush();
   
	}
    */
    
    
    
    
    /*---------------------------------------------------정희 추가

    // 상품 수정 페이지
    @GetMapping("/products/{p_id}/edit")
    public String showEditProductForm(@PathVariable("p_id") String p_id) {
        // 상품 정보 조회 및 수정 페이지로 이동
        return "my-store/product-management";
    }

    // 상품 수정 처리
    @PostMapping("/products/{p_id}")
    public String updateProduct(
            @PathVariable("p_id") String p_id,
            @RequestParam("name") String name,
            @RequestParam("price") int price,
            @RequestParam(value = "file", required = false) MultipartFile file) {
   
        // 상품 수정 로직
        ProductVO product = productService.getProductById(p_id);
        if (product != null) {
            product.setP_name(name);
            product.setPrice(price);
            if (!file.isEmpty()) {
                // 파일 업로드 처리 로직
                String fileName = saveFile(file);
                // 파일명을 이용하여 thumbnail 정보를 처리하는 로직을 구현합니다.
                // product.setThumbnail(fileName);
            }
            productService.updateProduct(product);
        }

        return "redirect:/store/st-products";
    }
*/

    // 상품 삭제 처리
    @RequestMapping(value = "/products/{p_id}", method = RequestMethod.DELETE)
    public String deleteProduct(@PathVariable("p_id") long p_id) {
        System.out.println("1");
    	// 상품 삭제 로직
    	productService.deleteProduct(p_id);
        return "redirect:/store/products/management";
    }

    

//----------------------------------------------------정희 추가
	
    
    

    
    
    
    
    
    
    
	

    ////* 크리에이터 리스트 조회 & 정렬 & 검색 *////
	@RequestMapping(value="/creators", method=RequestMethod.GET)
	public String getCreatorList(int page, String sort, Model model, String keyword) {
		
		
		// 정렬 및 페이징 , 검색 처리
		Page<CreatorListVO> list = null;
		Pageable pageable = PageRequest.of(page, 5, Sort.by(Sort.Direction.DESC, sort));	// 시작 페이지, 데이터 개수, 정렬 기준
		
		// 검색
		if(keyword != null) { 		// 검색 한 경우
			list = productService.getSearchCreatorList(keyword, pageable);
		}else { 					// 검색 안 한 경우
			keyword = "";
			list = productService.getCreatorList(pageable);		
		}
		
		// 대표 상품 리스트 조회
		HashMap<Long, List<ProductVO>> signature = new HashMap<>();
		for(CreatorListVO c : list.getContent()) {
			List<ProductVO> p = productService.getCreatorSignatureList(c.getId());
			for(ProductVO item : p) {
				if(signature.get(item.getId()) != null) {
					signature.get(item.getId()).add(item);
				}else {
					ArrayList<ProductVO> s_list = new ArrayList<>();
					s_list.add(item);
					signature.put(item.getId(), s_list);
				}
			}
		}

		int nowPage = list.getPageable().getPageNumber()+1;			// 현재 페이지, 0부터 시작하므로 +1
		int startPage = Math.max(nowPage-4, 1);						// 시작 페이지 번호
		int endPage = Math.min(nowPage+5, list.getTotalPages());	// 끝 페이지 번호
		
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("creators", list);
		model.addAttribute("signature", signature);
		model.addAttribute("sort", sort);
		model.addAttribute("keyword", keyword);
		
		return "/store/st-creators";
	}	
}


