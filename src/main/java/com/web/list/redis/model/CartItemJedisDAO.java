package com.web.list.redis.model;

import java.util.List;

import com.web.list.redis.JedisUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class CartItemJedisDAO {
	
	// 取得連線池
	private static JedisPool pool = JedisUtil.getJedisPool();
	
	public static List<String> selectOne(){
		Jedis jedis = null;
		jedis = pool.getResource(); // 連線
		
		
		jedis.select(1);

		List<String> cartItems = jedis.lrange("name", 0, -1); 
		return cartItems;
	}
	
	public static void addItemToCart(CartItemVO cartItemVO) {
		Jedis jedis = null;
		jedis = pool.getResource(); // 連線
		
		
		
	}
}
