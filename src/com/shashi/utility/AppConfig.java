package com.shashi.utility;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

public final class AppConfig {
	private static final String CONFIG_BUNDLE_NAME = "application";
	private static ResourceBundle bundle;

	private AppConfig() {
	}

	public static String getRequired(String propertyKey, String envKey) {
		String value = getOptional(propertyKey, envKey);
		if (value == null || value.trim().isEmpty()) {
			throw new IllegalStateException(
					"Missing configuration for " + propertyKey + ". Set " + envKey + " or application.properties.");
		}
		return value.trim();
	}

	public static String getOrDefault(String propertyKey, String envKey, String defaultValue) {
		String value = getOptional(propertyKey, envKey);
		return value == null || value.trim().isEmpty() ? defaultValue : value.trim();
	}

	private static String getOptional(String propertyKey, String envKey) {
		String envValue = System.getenv(envKey);
		if (envValue != null && !envValue.trim().isEmpty()) {
			return envValue;
		}

		ResourceBundle configBundle = getBundle();
		if (configBundle != null && configBundle.containsKey(propertyKey)) {
			return configBundle.getString(propertyKey);
		}

		return null;
	}

	private static ResourceBundle getBundle() {
		if (bundle != null) {
			return bundle;
		}

		try {
			bundle = ResourceBundle.getBundle(CONFIG_BUNDLE_NAME);
		} catch (MissingResourceException exception) {
			bundle = null;
		}

		return bundle;
	}
}
