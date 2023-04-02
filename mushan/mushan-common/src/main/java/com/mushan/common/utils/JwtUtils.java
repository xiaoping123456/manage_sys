package com.mushan.common.utils;

import com.mushan.common.pojo.sys.LonginUser;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import net.sf.jsqlparser.statement.select.KSQLWindow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Component
public class JwtUtils {

    private static final String CLAIM_KEY_USERNAME = "sub";
    private static final String CLAIM_KEY_CREATED = "created";
    //过期时间
    @Value("${jwt.expiration}")
    private Integer expiration;
    //密钥
    @Value("${jwt.secret}")
    private String secret;

    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    /**
     * 根据uuid生成token
     *
     * @param
     * @return
     */
    public String generatorToken(LonginUser user) {
        try {
            Map<String, Object> map = new HashMap<>();
            String uuid = UUID.randomUUID().toString();
            map.put(CLAIM_KEY_USERNAME,uuid);
            redisTemplate.opsForValue().set(CacheConstants.USER_TOKEN_UUID+uuid,user,expiration,TimeUnit.MILLISECONDS);
            return generatorToken(map);
        }catch (Exception e){
            return null;
        }
    }

    /**
     * 根据token获取uuid
     *
     * @return
     */
    public String getUserNameFormToken(String token) {
        String uuid = null;
        try {
            Claims claims = getClaimsFromToken(token);
            uuid = claims.getSubject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uuid;
    }




    /**
     * 刷新Token
     * @param token
     * @return
     */
    public String refreshToken(String token){
        Claims claims = getClaimsFromToken(token);
        claims.put(CLAIM_KEY_CREATED,new Date());
        return generatorToken(claims);
    }


    /**
     * 验证token是否过期
     * @param token
     * @return
     */
    private boolean isTokenExpired(String token) {
        Claims claims = getClaimsFromToken(token);
        Date exp = claims.getExpiration();
        return exp.before(new Date());
    }


    /**
     * 根据token获取负载
     *
     * @return
     */
    private Claims getClaimsFromToken(String token) {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }


    /**
     * 根据负载生成Token
     *
     * @param map
     * @return
     */
    private String generatorToken(Map<String, Object> map) {
        return Jwts.builder()
                .setClaims(map)
                .setExpiration(generatorExpiration())
                .signWith(SignatureAlgorithm.HS512, secret)
                .compact();
    }

    /**
     * 失效时间
     *
     * @return
     */
    private Date generatorExpiration() {
        return new Date(System.currentTimeMillis() + expiration);
    }


    public static void main(String[] args) {
        SimpleDateFormat  sdf1 = new SimpleDateFormat("HH:mm:ss");
        Date date = new Date(System.currentTimeMillis() + 1800000);
        String format = sdf1.format(date);
        System.out.println(format);
    }


}
