package com.teamproject.trackers.biz.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/products")
public class ProductController {

    private ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public void insertProduct(@RequestBody ProductDTO productDTO) {
        ProductVO productVO = new ProductVO();
        productVO.setP_name(productDTO.getName());
        productVO.setPrice(productDTO.getPrice());
        // 필요한 속성들을 추가로 설정합니다.
        
        productService.insertProduct(productVO);
    }

    @PutMapping("/{id}")
    public void updateProduct(@PathVariable long id, @RequestBody ProductDTO productDTO) {
        ProductVO productVO = new ProductVO();
        productVO.setId(id);
        productVO.setP_name(productDTO.getName());
        productVO.setPrice(productDTO.getPrice());
        // 필요한 속성들을 추가로 설정합니다.
        
        productService.updateProduct(productVO);
    }

    @DeleteMapping("/{id}")
    public void deleteProduct(@PathVariable long id) {
        productService.deleteProduct(id);
    }
}
