package com.teamproject.trackers.view.regularPurchase;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.teamproject.trackers.biz.purchase.PurchaseService;
import com.teamproject.trackers.biz.regularPurchase.VerifyService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/verifyIamport")
public class VerifyController {

	
	private VerifyService verifyService;
	
	/** Iamport 결제 검증 컨트롤러 **/
    private final IamportClient iamportClient;

    
    
	
    @Autowired
	public VerifyController(VerifyService verifyService) {
		this.verifyService = verifyService;
		this.iamportClient = new IamportClient("2683684427131538", "c8BLGUq15RxOKEEuKkHrpimIuaMK0mL4sJ5tPsaIDLddad9vKWAF9hIEltEjVDoPegGk4IrwCHW9A4cG");
		// 생성자를 통해 REST API 와 REST API secret 입력
	}
	


    /** 프론트에서 받은 PG사 결괏값을 통해 아임포트 토큰 발행 **/
    @PostMapping("/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable String imp_uid) throws IamportResponseException, IOException{
        System.out.println("paymentByImpUid 진입");
        return iamportClient.paymentByImpUid(imp_uid);
    }
	

    
    
    
    @RequestMapping(value="/getToken", method=RequestMethod.POST)
    public String getToken() {
    	String token = verifyService.getToken();
    	System.out.println(token);
    	return token;
    }
    
    
    
    
}
