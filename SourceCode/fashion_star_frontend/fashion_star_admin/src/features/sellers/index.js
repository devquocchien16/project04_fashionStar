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
import { showNotification } from "../common/headerSlice";
import { getSellers, blockSellers, unblockSellers } from "../../api/sellerAPI"; // Import the new API functions
import { CheckCircleIcon, UserCircleIcon, XCircleIcon } from '@heroicons/react/24/solid'; // Import icons for yes and no
import UserIcon from "@heroicons/react/24/outline/UserIcon";
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

function Sellers() {
  const { leads } = useSelector((state) => state.lead);
  const dispatch = useDispatch();
  const [sellers, setSellers] = useState([]); // State to store sellers
  const [selectedSellers, setSelectedSellers] = useState([]); // State to store selected sellers
  const [showModal, setShowModal] = useState(false); // State to control modal visibility
  const [modalMessage, setModalMessage] = useState(""); // State to store modal message
  const [showEnabledSellers, setShowEnabledSellers] = useState(true); // State to control which list of sellers to show
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(5);
  const [searchTerm, setSearchTerm] = useState("");
  useEffect(() => {
    dispatch(getLeadsContent());
    fetchSellers(); // Fetch sellers when component mounts
  }, []);

  // Function to fetch sellers from API
  const fetchSellers = async () => {
    try {
      const response = await fetch("http://localhost:5454/api/admins/sellers");
      if (!response.ok) {
        throw new Error("Failed to fetch sellers");
      }
      const data = await response.json();
      setSellers(data);
    } catch (error) {
      console.error("Error fetching users:", error);
    }
  };

  // Function to handle checkbox change
  const handleCheckboxChange = (sellerId) => {
    setSelectedSellers((prevSelectedSellers) => {
      if (prevSelectedSellers.includes(sellerId)) {
        return prevSelectedSellers.filter((id) => id !== sellerId);
      } else {
        return [...prevSelectedSellers, sellerId];
      }
    });
  };

  // Function to handle switching between enabled and disabled sellers
  const toggleEnabledSellers = (showEnabled) => {
    setShowEnabledSellers(showEnabled);
  };

  // Function to block selected sellers
  const handleBlockSelectedSellers = async () => {
    try {
      const queryString = selectedSellers.map((id) => `ids=${id}`).join("&");
      const response = await fetch(
        `http://localhost:5454/api/admins/block/sellers?${queryString}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ sellerIds: selectedSellers }), // Send selected seller ids in the request body
        }
      );

      if (response.ok) {
        setShowModal(true);
        setModalMessage("Selected sellers have been blocked successfully.");
        setSelectedSellers([]); // Clear selected sellers after blocking
      } else {
        throw new Error("Failed to block sellers");
      }
    } catch (error) {
      console.error("Error blocking sellers:", error);
    }
  };

  // Function to unblock selected sellers
  const handleUnblockSelectedSellers = async () => {
    try {
      const queryString = selectedSellers.map((id) => `ids=${id}`).join("&");
      const response = await fetch(
        `http://localhost:5454/api/admins/unblock/sellers?${queryString}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ sellerIds: selectedSellers }), // Send selected seller ids in the request body
        }
      );

      if (response.ok) {
        setShowModal(true);
        setModalMessage("Selected sellers have been unblocked successfully.");
        setSelectedSellers([]); // Clear selected sellers after unblocking
      } else {
        throw new Error("Failed to unblock sellers");
      }
    } catch (error) {
      console.error("Error unblocking sellers:", error);
    }
  };
  const handleSearchUsers = async () => {
    try {
      const response = await fetch(
        `http://localhost:5454/api/admins/sellers/search?keyword=${searchTerm}`
      );
      if (!response.ok) {
        throw new Error("Failed to search users");
      }
      const data = await response.json();
      setSellers(data);
    } catch (error) {
      console.error("Error searching users:", error);
    }
  };
  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const totalPages = Math.ceil(sellers.length / itemsPerPage);
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
  <div className="flex items-center">
    <button className="btn btn-icon btn-primary" onClick={handleSearchUsers}>
      <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M20 20l-4-4m4 0l-4 4m4-16a8 8 0 110 16 8 8 0 010-16z" />
      </svg>
    </button>
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
      className={`btn px-6 btn-sm normal-case ${showEnabledSellers ? "btn-primary" : "btn-secondary"} mr-2`}
      onClick={() => toggleEnabledSellers(true)}
    >
      Active Sellers
    </button>
    <button
      className={`btn px-6 btn-sm normal-case ${showEnabledSellers ? "btn-secondary" : "btn-primary"}`}
      onClick={() => toggleEnabledSellers(false)}
    >
      Blocked Sellers
    </button>
  </div>
</div>

      <TitleCard
        title={showEnabledSellers ? "Active Sellers" : "Blocked Sellers"}
        topMargin="mt-2"
      >
        <div className="overflow-x-auto w-full">
          <table className="table w-full">
            <thead>
              <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Enabled</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {sellers
                .filter((seller) =>
                  showEnabledSellers ? seller.enabled : !seller.enabled
                )
                .map((seller, index) => (
                  <tr key={index}>
                    <td>
                    <div className="flex items-center">
                        <UserCircleIcon className="w-6 h-6 mr-2 text-gray-500" />
                        {seller.sellerName}
                      </div>
                    </td>
                    <td>{seller.email}</td>
                    <td>{seller.phone}</td>
                    <td>{getStatusIcon(seller.enabled)}</td>
                    <td>
                      <input
                        type="checkbox"
                        checked={selectedSellers.includes(seller.id)}
                        onChange={() => handleCheckboxChange(seller.id)}
                      />
                    </td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
        <div className="flex justify-end mt-4">
          {totalPages > 1 && (
            <ul className="pagination">
              <li
                className={`page-item ${currentPage === 1 ? "disabled" : ""}`}
              >
                <button
                  className="page-link"
                  onClick={() => handlePageChange(currentPage - 1)}
                >
                  Previous
                </button>
              </li>
              {Array.from({ length: totalPages }, (_, index) => (
                <li
                  key={index}
                  className={`page-item ${
                    currentPage === index + 1 ? "active" : ""
                  }`}
                >
                  <button
                    className="page-link"
                    onClick={() => handlePageChange(index + 1)}
                  >
                    {index + 1}
                  </button>
                </li>
              ))}
              <li
                className={`page-item ${
                  currentPage === totalPages ? "disabled" : ""
                }`}
              >
                <button
                  className="page-link"
                  onClick={() => handlePageChange(currentPage + 1)}
                >
                  Next
                </button>
              </li>
            </ul>
          )}
        </div>
        <div className="flex justify-end mt-4">
          {showEnabledSellers && (
            <button
              className={`btn px-6 btn-sm normal-case ${
                selectedSellers.length > 0 ? "btn-danger" : "btn-disabled"
              } mr-2`}
              onClick={handleBlockSelectedSellers}
              disabled={selectedSellers.length === 0}
            >
              Block
            </button>
          )}
          {!showEnabledSellers && (
            <button
              className={`btn px-6 btn-sm normal-case ${
                selectedSellers.length > 0 ? "btn-success" : "btn-disabled"
              } mr-2`}
              onClick={handleUnblockSelectedSellers}
              disabled={selectedSellers.length === 0}
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

export default Sellers;
