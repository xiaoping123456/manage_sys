package com.mushan.admin.controller.sys;

import com.google.code.kaptcha.Producer;
import com.mushan.common.utils.Base64;
import com.mushan.common.utils.CacheConstants;
import com.mushan.common.utils.ResponseUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 验证码生成类
 */
@RestController
@RequestMapping("/captchaImage")
public class CaptchaController {

    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private Producer captchaProducerMath;

    /**
     * 生成验证码
     * 将验证码信息存储到redsi
     * @param response
     * @return
     */
    @GetMapping()
    public Object getCode(HttpServletResponse response){
        String uuid = UUID.randomUUID().toString(); //生成uuid
        Map<String,Object> map = new HashMap<>();
        String capText = captchaProducerMath.createText();
        String capStr = capText.substring(0, capText.lastIndexOf("@"));
        String code = capText.substring(capText.lastIndexOf("@") + 1);
        BufferedImage image = captchaProducerMath.createImage(capStr);
        redisTemplate.opsForValue().set(CacheConstants.CAPTCHA_CODE_KEY+uuid,code,10, TimeUnit.MINUTES); //一分钟
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try {
            ImageIO.write(image, "jpg", os);
        }   catch (IOException e)
        {
            return ResponseUtils.fail(-1,e.getMessage());
        }
        map.put("uuid",uuid);
        map.put("img", Base64.encode(os.toByteArray()));
        return ResponseUtils.ok(map);
    }
}
