import React from "react";
import moment from "moment";
import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import TitleCard from "../../components/Cards/TitleCard";
import { openModal } from "../common/modalSlice";
import { deleteLead, getLeadsContent } from "./leadSlice";
import {
  CONFIRMATION_MODAL_CLOSE_TYPES,
  MODAL_BODY_TYPES,
} from "../../utils/globalConstantUtil";
import TrashIcon from "@heroicons/react/24/outline/TrashIcon";
import { showNotification } from "../common/headerSlice"; // Import the new API functions
import UserIcon from "@heroicons/react/24/outline/UserIcon";
import { CheckCircleIcon, XCircleIcon } from '@heroicons/react/24/solid'; // Import icons for yes and no
import { UserCircleIcon } from "@heroicons/react/24/outline";
const TopSideButtons = () => {
  const dispatch = useDispatch();

  const openAddNewLeadModal = () => {
    dispatch(
      openModal({
        title: "Add New Lead",
        bodyType: MODAL_BODY_TYPES.LEAD_ADD_NEW,
      })
    );
  };

  return (
    <div className="inline-block float-right">
      <button
        className="btn px-6 btn-sm normal-case btn-primary"
        onClick={() => openAddNewLeadModal()}
      >
        Add New
      </button>
    </div>
  );
};

function Lead() {
  const { leads } = useSelector((state) => state.lead);
  const dispatch = useDispatch();
  const [users, setUsers] = useState([]); // State to store users
  const [selectedUsers, setSelectedUsers] = useState([]); // State to store selected users
  const [showModal, setShowModal] = useState(false); // State to control modal visibility
  const [modalMessage, setModalMessage] = useState(""); // State to store modal message
  const [showEnabledUsers, setShowEnabledUsers] = useState(true); // State to control which list of users to show
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(5);
  const [searchTerm, setSearchTerm] = useState("");
  useEffect(() => {
    dispatch(getLeadsContent());
    fetchUsers(); // Fetch users when component mounts
  }, []);

  // Function to fetch users from API
  const fetchUsers = async () => {
    try {
      const response = await fetch("http://localhost:5454/api/admins/users");
      if (!response.ok) {
        throw new Error("Failed to fetch users");
      }
      const data = await response.json();
      setUsers(data);
    } catch (error) {
      console.error("Error fetching users:", error);
    }
  };

  // Function to handle checkbox change
  const handleCheckboxChange = (userId) => {
    setSelectedUsers((prevSelectedUsers) => {
      if (prevSelectedUsers.includes(userId)) {
        return prevSelectedUsers.filter((id) => id !== userId);
      } else {
        return [...prevSelectedUsers, userId];
      }
    });
  };

  // Function to handle switching between enabled and disabled users
  const toggleEnabledUsers = (showEnabled) => {
    setShowEnabledUsers(showEnabled);
  };

  // Function to block selected users
  const handleBlockSelectedUsers = async () => {
    try {
      const queryString = selectedUsers.map((id) => `ids=${id}`).join("&");
      const response = await fetch(
        `http://localhost:5454/api/admins/block/users?${queryString}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ userIds: selectedUsers }), // Send selected user ids in the request body
        }
      );

      if (response.ok) {
        setShowModal(true);
        setModalMessage("Selected users have been blocked successfully.");
        setSelectedUsers([]); // Clear selected users after blocking
      } else {
        throw new Error("Failed to block users");
      }
    } catch (error) {
      console.error("Error blocking users:", error);
    }
  };

  // Function to unblock selected users
  const handleUnblockSelectedUsers = async () => {
    try {
      const queryString = selectedUsers.map((id) => `ids=${id}`).join("&");
      const response = await fetch(
        `http://localhost:5454/api/admins/unblock/users?${queryString}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ userIds: selectedUsers }), // Send selected user ids in the request body
        }
      );

      if (response.ok) {
        setShowModal(true);
        setModalMessage("Selected users have been unblocked successfully.");
        setSelectedUsers([]); // Clear selected users after unblocking
      } else {
        throw new Error("Failed to unblock users");
      }
    } catch (error) {
      console.error("Error unblocking users:", error);
    }
  };
  const handleSearchUsers = async () => {
    try {
      const response = await fetch(
        `http://localhost:5454/api/admins/users/search?keyword=${searchTerm}`
      );
      if (!response.ok) {
        throw new Error("Failed to search users");
      }
      const data = await response.json();
      setUsers(data);
    } catch (error) {
      console.error("Error searching users:", error);
    }
  };
  
  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const totalPages = Math.ceil(users.length / itemsPerPage);

  // Function to get status icon based on user's enabled status
  const getStatusIcon = (enabled) => {
    return enabled ? (
      <CheckCircleIcon className="w-6 h-6 text-green-500" />
    ) : (
      <XCircleIcon className="w-6 h-6 text-red-500" />
    );
  };

  return (
    <>
    <div className="flex justify-between items-center mb-4">
        <div>
          <button className="btn btn-primary" onClick={handleSearchUsers}>Search</button>
          <input
            type="text"
            placeholder="Search..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="border border-gray-300 px-4 py-2 rounded-md ml-2"
          />
        </div>
        <div>
          <button
            className={`btn px-6 btn-sm normal-case ${showEnabledUsers ? "btn-primary" : "btn-secondary"} mr-2`}
            onClick={() => toggleEnabledUsers(true)}
          >
            Active users
          </button>
          <button
            className={`btn px-6 btn-sm normal-case ${showEnabledUsers ? "btn-secondary" : "btn-primary"}`}
            onClick={() => toggleEnabledUsers(false)}
          >
            Blocked users
          </button>
        </div>
      </div>

      <TitleCard
        title={showEnabledUsers ? "Active users" : "Blocked users"}
        topMargin="mt-2"
      >
        <div className="overflow-x-auto w-full">
          <table className="table w-full">
            <thead>
              <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {users
                .filter((user) =>
                  showEnabledUsers ? user.enabled : !user.enabled
                )
                .map((user, index) => (
                  <tr key={index}>
                    <td>
                      <div className="flex items-center">
                        <UserCircleIcon className="w-6 h-6 mr-2 text-gray-500" />
                        {user.clientName}
                      </div>
                    </td>
                    <td>{user.email}</td>
                    <td>{user.phone}</td>
                    <td>
                      {getStatusIcon(user.enabled)}
                    </td>
                    <td>
                      <input
                        type="checkbox"
                        checked={selectedUsers.includes(user.id)}
                        onChange={() => handleCheckboxChange(user.id)}
                      />
                    </td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
        <div className="mt-4">
          {totalPages > 1 && (
            <ul className="flex list-none">
              <li className={`mr-2 ${currentPage === 1 ? "opacity-50 cursor-not-allowed" : ""}`}>
                <button
                  className="btn btn-sm"
                  onClick={() => handlePageChange(currentPage - 1)}
                  disabled={currentPage === 1}
                >
                  Previous
                </button>
              </li>
              {Array.from({ length: totalPages }, (_, index) => (
                <li key={index} className="mr-2">
                  <button
                    className={`btn btn-sm ${currentPage === index + 1 ? "bg-blue-500 text-white" : ""}`}
                    onClick={() => handlePageChange(index + 1)}
                  >
                    {index + 1}
                  </button>
                </li>
              ))}
              <li className={`ml-2 ${currentPage === totalPages ? "opacity-50 cursor-not-allowed" : ""}`}>
                <button
                  className="btn btn-sm"
                  onClick={() => handlePageChange(currentPage + 1)}
                  disabled={currentPage === totalPages}
                >
                  Next
                </button>
              </li>
            </ul>
          )}
        </div>
        <div className="flex justify-end mt-4">
          {showEnabledUsers && (
            <button
              className={`btn px-6 btn-sm normal-case ${
                selectedUsers.length > 0 ? "btn-danger" : "btn-disabled"
              } mr-2`}
              onClick={handleBlockSelectedUsers}
              disabled={selectedUsers.length === 0}
            >
              Block
            </button>
          )}
          {!showEnabledUsers && (
            <button
              className={`btn px-6 btn-sm normal-case ${
                selectedUsers.length > 0 ? "btn-success" : "btn-disabled"
              } mr-2`}
              onClick={handleUnblockSelectedUsers}
              disabled={selectedUsers.length === 0}
            >
              Unblock
            </button>
          )}
        </div>
      </TitleCard>

      {showModal && (
        <div className="fixed top-0 left-0 flex items-center justify-center z-50 h-full w-full">
          <div className="bg-white rounded-lg p-8 shadow-md">
            <p className="text-lg font-semibold mb-4">{modalMessage}</p>
            <button
              className="btn btn-primary"
              onClick={() => setShowModal(false)}
            >
              OK
            </button>
          </div>
        </div>
      )}
    </>
  );
}

export default Lead;
