package com.skilldistillery.beerhound;

import java.util.List;

public class CustomFunctions {
	public static boolean contains(List list, Object o) {
		if (list == null) {
			return false;
		}
		return list.contains(o);
	}
}
