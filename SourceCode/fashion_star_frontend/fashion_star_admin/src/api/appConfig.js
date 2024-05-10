import axios from "axios";

export const API_BASE_URL = "http://localhost:5454/api";
const api = axios.create({
    baseURL: API_BASE_URL,
    headers: {
        "Content-Type": "application/json",
    },
});
api.interceptors.request.use(
    (config) => {
        const jwt = localStorage.getItem("admin_token");
        if (jwt) {
            config.headers.Authorization = `Bearer ${jwt}`;
        }
        return config;
    },
    (error) => {
        // Handle request error
        return Promise.reject(error);
    }
);

// Add a response interceptor
api.interceptors.response.use(
    (response) => {
        if (response && response.data) {
            return response.data;
        }
        return response;
    },
    (error) => {
        // Handle response error
        throw error;
    }
);

export default api;
