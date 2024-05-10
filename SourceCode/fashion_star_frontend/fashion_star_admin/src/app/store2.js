
import { configureStore } from "@reduxjs/toolkit";
import {
    FLUSH,
    PAUSE,
    PERSIST,
    PURGE,
    REGISTER,
    REHYDRATE,
    persistReducer,
    persistStore,
} from "redux-persist";

import adminReducer from "../slice/adminSlice";
import storage from "redux-persist/lib/storage";


const persistConfig = {
    key: "root",
    version: 1,
    storage,
};

const adminPersistedReducer = persistReducer(persistConfig, adminReducer);


export const store = configureStore({
    reducer: {
        admin: adminPersistedReducer,
    },
    middleware: (getDefaultMiddleware) =>
        getDefaultMiddleware({
            serializableCheck: {
                ignoredActions: [FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER],
            },
        }),
});

export let persistor = persistStore(store);
