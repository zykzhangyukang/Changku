package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.ImageJson;
import com.coderman.changku.sys.commons.Result;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.mapper.ImageMapper;
import com.coderman.changku.sys.modal.Image;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.provider.OssUploadImgProvider;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhangyukang on 2019/10/31 15:18
 */
@RestController
@RequestMapping("/file")
public class FileController {

    @Autowired
    private OssUploadImgProvider ossUploadImgProvider;

    @Autowired
    private ImageMapper imageMapper;
    /**
     * 文件上传
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public ResultObj updateImage(@RequestParam("file") MultipartFile file) {
        User user = (User) WebUtil.getSession().getAttribute("user");
        try {
            String url = ossUploadImgProvider.UploadFile(file.getInputStream(), file.getContentType(), file.getOriginalFilename());
            Image image = new Image();
            image.setCreator(user.getName());
            image.setUrl(url);
            image.setGmtCreate(System.currentTimeMillis());
            image.setGmtModified(System.currentTimeMillis());
            imageMapper.insertSelective(image);
            return ResultObj.UPLOAD_SUCCESS;
        } catch (IOException e) {
            e.printStackTrace();
            return ResultObj.UPLOAD_ERROR;
        }
    }

    /**
     * 加载图片的Json串
     * @return
     */
    @GetMapping("/loadImagesJson")
    public Result loadImagesJson(){
        List<Image> images = imageMapper.selectByExample(null);
        List<ImageJson> imageJsons=new ArrayList<>();
        if(images.size()>0){
            imageJsons=new ArrayList<>();
            for (Image image : images) {
                ImageJson imageJson = new ImageJson();
                imageJson.setPid(image.getId().toString());
                imageJson.setSrc(image.getUrl());
                imageJson.setAlt("美女生活照"+image.getId());
                imageJson.setThumb(image.getUrl());
                imageJsons.add(imageJson);
            }
        }
        return new Result(imageJsons);
    }
}
