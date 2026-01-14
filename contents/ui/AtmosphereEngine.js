.pragma library

/**
 * AtmosphereEngine.js
 *
 * This module handles the weather data processing logic.
 * It normalizes data from different providers into a standard format.
 */

/**
 * Normalizes weather data from an API response.
 *
 * @param {Object} rawData - The raw JSON object from the weather provider.
 * @returns {Object|null} A normalized weather object or null if input is invalid.
 *
 * Normalized format:
 * {
 *   temperature: Number, // in Celsius
 *   condition: String,   // e.g., "Sunny", "Rain"
 *   humidity: Number,    // percentage 0-100
 *   windSpeed: Number    // in km/h
 * }
 */
function normalizeWeatherData(rawData) {
    if (!rawData || typeof rawData !== 'object') {
        console.warn("AtmosphereEngine: normalizeWeatherData: Invalid raw data.");
        return null;
    }

    // This is a mock implementation assuming a generic structure.
    // In a real scenario, this would check the provider type or handle specific fields.
    // For now, we assume a structure like { temp_c: 20, condition: { text: "Sunny" }, humidity: 50, wind_kph: 10 }

    // We check for minimal required fields. This logic would be more complex in production.
    // Here we try to adapt standard keys found in many APIs (like WeatherAPI, OpenWeatherMap simplified).

    var normalized = {};

    // Temperature
    if (rawData.hasOwnProperty('temp_c')) {
        normalized.temperature = rawData.temp_c;
    } else if (rawData.hasOwnProperty('temperature')) {
        normalized.temperature = rawData.temperature;
    } else {
        // Default or error
        normalized.temperature = null;
    }

    // Condition
    if (rawData.hasOwnProperty('condition') && rawData.condition && typeof rawData.condition.text === 'string') {
        normalized.condition = rawData.condition.text;
    } else if (rawData.hasOwnProperty('condition') && typeof rawData.condition === 'string') {
        normalized.condition = rawData.condition;
    } else {
        normalized.condition = "Unknown";
    }

    // Humidity
    if (rawData.hasOwnProperty('humidity')) {
        normalized.humidity = rawData.humidity;
    } else {
        normalized.humidity = null;
    }

    // Wind Speed
    if (rawData.hasOwnProperty('wind_kph')) {
        normalized.windSpeed = rawData.wind_kph;
    } else if (rawData.hasOwnProperty('windSpeed')) {
        normalized.windSpeed = rawData.windSpeed;
    } else {
        normalized.windSpeed = null;
    }

    return normalized;
}
