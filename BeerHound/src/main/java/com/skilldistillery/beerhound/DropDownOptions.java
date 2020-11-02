package com.skilldistillery.beerhound;

import java.util.ArrayList;
import java.util.List;

public class DropDownOptions {

	private static String[] statesArray = { "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI",
			"IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE",
			"NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA",
			"WI", "WV", "WY" };

	private static List<String> states = new ArrayList<>();
	static {
		for (String string : statesArray) {
			states.add(string);
		}
	}
	public static String[] getStatesArray() {
		return statesArray;
	}
	public static void setStatesArray(String[] statesArray) {
		DropDownOptions.statesArray = statesArray;
	}
	public static List<String> getStates() {
		return states;
	}
	public static void setStates(List<String> states) {
		DropDownOptions.states = states;
	}
}
