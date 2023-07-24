package com.teamproject.trackers.view.followSubscribeLike;

import java.text.DecimalFormat;

import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamproject.trackers.biz.common.AlertVO;
import com.teamproject.trackers.biz.drive.DriveController;
import com.teamproject.trackers.biz.followSubscribeLike.SubscribeInfoService;
import com.teamproject.trackers.biz.followSubscribeLike.SubscribeInfoVO;
import com.teamproject.trackers.view.common.CommonController;


@Controller
@RequestMapping("/store")
public class SubscribeController {

	@Autowired
	private DriveController drive;
	@Autowired
	private SubscribeInfoService subscribeInfoService;
	@Autowired
    private HttpSession session;
	@Autowired
	public CommonController common;
	
	// 구독 정보 조회
	@RequestMapping(value="/subscribes", method=RequestMethod.GET)
	public String getCreator(SubscribeInfoVO vo, Model model) {
		vo.setId((long)session.getAttribute("id"));
		
		SubscribeInfoVO subscribe = subscribeInfoService.getSubscribeInfo(vo);
		model.addAttribute("subscribe", subscribe);

		// 세자리 마다 , 붙이기
		if(subscribe != null) {
			DecimalFormat decFormat = new DecimalFormat("###,###");
			String price = decFormat.format(subscribe.getPrice());
			model.addAttribute("price", price);
		}

		return "/my-store/subscribe-management";	// 스토어 관리 임시연결
	}
	
	// 구독 활성화(등록 및 수정)
	@RequestMapping(value="/subscribes", method=RequestMethod.POST)
	public String updateSubscribeInfo(SubscribeInfoVO vo, @RequestParam("mfile") MultipartFile mfile) throws Exception {
		vo.setId((long)session.getAttribute("id"));
		SubscribeInfoVO infoVO = subscribeInfoService.getSubscribeInfo(vo);
		
		if(infoVO == null) {		// 등록
			//vo.setFile(drive.SubscribeUpload(vo, mfile));			// 파일 저장 후 경로 저장
			subscribeInfoService.insertSubscribeInfo(vo);
			common.alert.setStr("구독이 활성화되었습니다.");
		}else {
			//drive.SubscribeDelete(infoVO);						// 저번 달 파일 삭제
			//vo.setFile(drive.SubscribeUpload(vo, mfile));			// 파일 저장 후 경로 저장
			subscribeInfoService.updateSubscribeInfo(vo);
			common.alert.setStr("구독 정보가 업데이트되었습니다.");
		}

		common.alert.setPath("store/subscribes");
		common.alert.setFlag(true);
		
		return "redirect:/common";
	}
	
	// 구독 비활성화(삭제)
	@RequestMapping(value="/subscribes", method=RequestMethod.DELETE)
	public String deleteSubscribeInfo(SubscribeInfoVO vo) throws Exception {
		vo.setId((long)session.getAttribute("id"));
		
		//drive.SubscribeDelete(subscribeInfoService.getSubscribeInfo(vo));
		
		subscribeInfoService.deleteSubscribeInfo(vo);
		
		common.alert.setStr("구독이 비활성화되었습니다.");
		common.alert.setPath("/store/subscribes");
		common.alert.setFlag(true);

		return "redirect:/common";
	}
}
