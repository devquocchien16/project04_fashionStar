import { configureStore, getDefaultMiddleware } from '@reduxjs/toolkit';
import { FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER } from 'redux-persist';
import storage from 'redux-persist/lib/storage';
import { persistReducer, persistStore } from 'redux-persist';

// Import your slices or reducers
import headerSlice from '../features/common/headerSlice';
import modalSlice from '../features/common/modalSlice';
import rightDrawerSlice from '../features/common/rightDrawerSlice';
import leadsSlice from '../features/leads/leadSlice';
import adminReducer from '../slice/adminSlice';

// Define persist configuration
const persistConfig = {
  key: 'root',
  version: 1,
  storage,
};

// Wrap adminReducer with persistReducer
const persistedReducer = persistReducer(persistConfig, adminReducer);

// Combine all reducers
const rootReducer = {
  header: headerSlice,
  rightDrawer: rightDrawerSlice,
  modal: modalSlice,
  lead: leadsSlice,
  admin: persistedReducer, // Use the wrapped persisted reducer
};

// Configure the store
const store = configureStore({
  reducer: rootReducer,
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoredActions: [FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER],
      },
    }),
});

// Create the persistor
const persistor = persistStore(store);

export { store, persistor };
