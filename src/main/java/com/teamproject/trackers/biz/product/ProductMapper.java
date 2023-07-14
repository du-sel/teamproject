package com.teamproject.trackers.biz.product;

import org.springframework.stereotype.Component;

@Component
public class ProductMapper {
    public ProductEntity toEntity(ProductVO productVO) {
        ProductEntity entity = new ProductEntity();
        entity.setId(productVO.getId());
        entity.setName(productVO.getP_name());
        entity.setPrice(productVO.getPrice());
        // 필요한 속성들을 추가로 매핑합니다.
        return entity;
    }
    
    public ProductVO toVO(ProductEntity entity) {
        ProductVO productVO = new ProductVO();
        productVO.setId(entity.getId());
        productVO.setP_name(entity.getName());
        productVO.setPrice(entity.getPrice());
        // 필요한 속성들을 추가로 매핑합니다.
        return productVO;
    }
}
