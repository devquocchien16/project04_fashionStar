import api from "./appConfig";

const adminApi = {
    async findAdmin(adminID, token) {
        let result = null;
        try {
            result = await api.get(`/admins/${adminID}`, {
                headers: { Authorization: "Bearer " + token },
            });
            console.log("RESULETE admin API : " + result);
            return result;
        } catch (e) {
            console.log("Find admin API error: " + e);
        }
    },
    async loginAdmin(data) {

        let result = null;
        try {
            const url = '/login/admin';
            result = await api.post(url, data);
            console.log("login admin token: " + result);
        } catch (e) {
            console.log("Find admin API error: " + e);
        }
        return result;
    },
}

export default adminApi;