package com.coderman.changku.biz.service.impl;

import com.coderman.changku.biz.commons.BizResultObject;
import com.coderman.changku.biz.commons.IDUtils;
import com.coderman.changku.biz.dto.ProductDataDTO;
import com.coderman.changku.biz.exception.BizException;
import com.coderman.changku.biz.mapper.ProductsDataMapper;
import com.coderman.changku.biz.mapper.ProductsMapper;
import com.coderman.changku.biz.modal.Products;
import com.coderman.changku.biz.modal.ProductsData;
import com.coderman.changku.biz.modal.ProductsDataExample;
import com.coderman.changku.biz.modal.ProductsExample;
import com.coderman.changku.biz.service.ProductsService;
import com.coderman.changku.biz.vo.ProductsVo;
import com.coderman.changku.sys.commons.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by zhangyukang on 2019/11/2 10:40
 */
@Service
public class ProductsServiceImpl implements ProductsService {

    @Autowired
    private ProductsMapper productsMapper;

    @Autowired
    private ProductsDataMapper productsDataMapper;

    @Override
    public void add(ProductsVo productsVo) {
        productsMapper.insertSelective(productsVo);
    }

    @Override
    public void delete(String id) {
        productsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Page<Products> listProducts(ProductsVo productsVo, Integer page, Integer limit) {
        ProductsExample productsExample = createProductsExample(productsVo);
        PageHelper.startPage(page,limit);
        List<Products> products = productsMapper.selectByExample(productsExample);
        com.github.pagehelper.Page<Products> productsPage= (com.github.pagehelper.Page<Products>) products;
        return new Page<>(productsPage.getTotal(),productsPage.getResult());
    }

    @Transactional
    @Override
    public void saveOrUpdate(ProductsVo productsVo) {
        //添加一条入库记录
        productsMapper.insertSelective(productsVo);

        //类型
        String producttype = productsVo.getProducttype();
        //品牌
        String productbrand = productsVo.getProductbrand();
        //型号
        String productmodel = productsVo.getProductmodel();
        ProductsDataExample productsDataExample = new ProductsDataExample();
        productsDataExample.createCriteria().andProductbrandEqualTo(productbrand)
                            .andProducttypeEqualTo(producttype).andProductmodelEqualTo(productmodel);
        List<ProductsData> productsData = productsDataMapper.selectByExample(productsDataExample);
        if(productsData.size()>0){
            ProductsData pd = productsData.get(0);
            Integer allsum = pd.getAllsum();
            BigDecimal productsingleprice = pd.getProductsingleprice();
            //更新商品的库存
            pd.setAllsum(allsum+productsVo.getProductcount());
            //更新商品的总价
            pd.setProductsprice(productsingleprice.add(productsVo.getProductsprice()));
            productsDataMapper.updateByPrimaryKeySelective(pd);
        }else {
            //添加新商品到库存中
            ProductsData p = new ProductsData();
            p.setProducttype(productsVo.getProducttype());
            p.setUnit(productsVo.getUnit());
            p.setProductmodel(productsVo.getProductmodel());
            p.setFid(IDUtils.getGUID());
            p.setType(productsVo.getType());
            p.setAddtime(new Date().toString());
            p.setManager(productsVo.getManager());
            p.setMerchantname(productsVo.getMerchantname());
            p.setOperator(productsVo.getOperator());
            p.setProductsingleprice(productsVo.getProductsingleprice());
            p.setProductsprice(productsVo.getProductsprice());
            p.setProductbrand(productsVo.getProductbrand());
            p.setAllsum(productsVo.getProductcount());
            productsDataMapper.insertSelective(p);
        }

    }

    @Override
    public void deProductStock(List<ProductDataDTO> list) {
        for (ProductDataDTO productsData : list) {
            ProductsData data = productsDataMapper.selectByPrimaryKey(productsData.getId());
            Integer result=data.getAllsum()-Integer.parseInt(productsData.getOutcount());
            if(result<0){
                throw new BizException(BizResultObject.STOCK_ERROR);
            }
            //总价(数据库)
            BigDecimal productsprice = data.getProductsprice();
            int count=Integer.parseInt(productsData.getOutcount());
            data.setProductsprice(productsprice.subtract(data.getProductsingleprice().multiply(new BigDecimal(count))));
            data.setAllsum(result);
            productsDataMapper.updateByPrimaryKeySelective(data);
        }
    }

    private ProductsExample createProductsExample(ProductsVo productsVo) {
        ProductsExample productsExample = new ProductsExample();
        ProductsExample.Criteria criteria = productsExample.createCriteria();
        if(productsVo!=null){
            if(productsVo.getMerchantname()!=null&&!"".equals(productsVo.getMerchantname())){
                criteria.andMerchantnameLike("%"+productsVo.getMerchantname()+"%");
            }
            if(productsVo.getProductbrand()!=null&&!"".equals(productsVo.getProductbrand())){
                criteria.andProductbrandLike("%"+productsVo.getProductbrand()+"%");
            }
            if(productsVo.getProducttype()!=null&&!"".equals(productsVo.getProducttype())){
                criteria.andProducttypeLike("%"+productsVo.getProducttype()+"%");
            }
            if(productsVo.getManager()!=null&&!"".equals(productsVo.getManager())){
                criteria.andManagerLike("%"+productsVo.getManager()+"%");
            }
        }
        return productsExample;
    }
}
