package com.bbs.utils;

import java.util.UUID;


public final class Utils {
	public static String createUUID(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}

}