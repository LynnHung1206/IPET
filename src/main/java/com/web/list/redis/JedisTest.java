package com.web.list.redis;

import com.web.list.redis.model.CartItemJedisDAO;
import com.web.list.redis.model.CartItemVO;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisTest {
	private static JedisPool pool = null;

	public static void main(String[] args) {
//		Jedis jedis = null;
//		try {
//			jedis = new Jedis("localhost", 6379);
//			System.out.println(jedis.ping());
//		} finally {
//			if (jedis != null)
//				jedis.close();
//		}
		
		
		pool = JedisUtil.getJedisPool();
		Jedis jedis = pool.getResource();
		System.out.println(jedis.ping());

		jedis.close();
		JedisUtil.shutdownJedisPool();
		
//		pool = JedisUtil.getJedisPool();
//		Jedis jedis = pool.getResource();
//		
//		jedis.set("test11", "Hello, Redis~");
//		System.out.println("myKey is: " + jedis.get("myKey"));
//		
//		jedis.close();
//		JedisUtil.shutdownJedisPool();
		
		CartItemVO cartItemVO = new CartItemVO();
		cartItemVO.setProdID(1);
		cartItemVO.setCount(5);
		cartItemVO.setPrice(100);
		cartItemVO.setProdName("大香蕉");
		
		CartItemJedisDAO ca = new CartItemJedisDAO();
		
	}

}
