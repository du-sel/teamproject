package com.teamproject.trackers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class TmpHandler implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String path = request.getServletPath();
		System.out.println("getServletPath(): "+path);

		
		if(path.equals("/products.do")) {
			mav.setViewName("./WEB-INF/views/store/st-products.jsp");			
		}
		else if(path.equals("/product-single.do")) {			
			mav.setViewName("./WEB-INF/views/store/st-product-single.jsp");			
		}
		else if(path.equals("/creators.do")) {			
			mav.setViewName("./WEB-INF/views/store/st-creators.jsp");			
		}
		else if(path.equals("/signin-modal.do")) {			
			mav.setViewName("./WEB-INF/views/modal/signin-modal.jsp");			
		}
		else if(path.equals("/signup-modal.do")) {			
			mav.setViewName("./WEB-INF/views/modal/signup-modal.jsp");			
		}
		else if(path.equals("/shop-create-modal.do")) {			
			mav.setViewName("./WEB-INF/views/modal/shop-create-modal.jsp");			
		}
		else if(path.equals("/co-main.do")) {			
			mav.setViewName("./WEB-INF/views/community/co-main.jsp");			
		}
		else if(path.equals("/st-main.do")) {			
			mav.setViewName("./WEB-INF/views/store/st-main.jsp");			
		}
		else if(path.equals("/cart.do")) {	
			mav.setViewName("./WEB-INF/views/my/cart.jsp");			
		}
		else if(path.equals("/purchase-history.do")) {			
			mav.setViewName("./WEB-INF/views/my/purchase-history.jsp");			
		}
		else if(path.equals("/inquiry-history.do")) {			
			mav.setViewName("./WEB-INF/views/my/inquiry-history.jsp");			
		}
		else if(path.equals("/user-modify.do")) {			
			mav.setViewName("./WEB-INF/views/my/user-modify.jsp");			
		}
		else if(path.equals("/user-pwd-modify.do")) {			
			mav.setViewName("./WEB-INF/views/my/user-pwd-modify.jsp");			
		}
		else if(path.equals("/news.do")) {			
			mav.setViewName("./WEB-INF/views/my/news.jsp");			
		}
		else if(path.equals("/sales-status.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/sales-status.jsp");			
		}
		else if(path.equals("/product-management.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/product-management.jsp");			
		}
		else if(path.equals("/calculate-history.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/calculate-history.jsp");			
		}
		else if(path.equals("/review-management.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/review-management.jsp");			
		}
		else if(path.equals("/review-management-form.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/review-management-form.jsp");			
		}
		else if(path.equals("/inquiry-management.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/inquiry-management.jsp");			
		}
		else if(path.equals("/inquiry-management-form.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/inquiry-management-form.jsp");			
		}
		else if(path.equals("/notice-management.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/notice-management.jsp");			
		}
		else if(path.equals("/store-management.do")) {			
			mav.setViewName("./WEB-INF/views/my-store/store-management.jsp");			
		}
		else if(path.equals("/post.do")) {			
			mav.setViewName("./WEB-INF/views/community/post.jsp");			
		} 
		else if(path.equals("/profile.do")) {		
			mav.setViewName("./WEB-INF/views/profile/profile.jsp");			
		}		
		
		return mav;
	}
	
	
	

}
