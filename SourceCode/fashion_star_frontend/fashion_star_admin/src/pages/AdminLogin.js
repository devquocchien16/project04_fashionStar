import React, { useState } from 'react';
import PropTypes from 'prop-types';
import { useDispatch } from 'react-redux';
import { unwrapResult } from '@reduxjs/toolkit';
import { loginAdmin, setAdminInfo } from '../slice/adminSlice';
import SignInForm from './SignInForm';
import { useNavigate } from 'react-router-dom';
AdminLogin.propTypes = {

};

function AdminLogin(props) {
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const [admin, setAdmin] = useState(null);
    const handleSubmit = async (values) => {
        console.log('form submit', values);
        try {
            // Pass values to register action
            const result = await dispatch(loginAdmin(values));
            const admin = unwrapResult(result);
            console.log("admin:  ", admin);
            const result_admin = await dispatch(setAdminInfo(admin));
            const ad = unwrapResult(result_admin);
            console.log("admin:  ", ad);
            setAdmin(ad)
            setTimeout(() => {
                navigate("/app/welcome");
            }, 0);

            // console.log(seller);

        } catch (error) {
            console.log('fail to login', error);

        }
    }
    return (
        <div>
            <SignInForm onSubmit={handleSubmit} />
        </div>
    );
}

export default AdminLogin;