import React, { useEffect, useState } from "react";
import { HomeIcon } from '@heroicons/react/24/outline';
import TitleCard from "../../components/Cards/TitleCard";
import { ExclamationCircleIcon, CheckCircleIcon } from "@heroicons/react/24/solid";
function Stores() {
  const [stores, setStores] = useState([]);
  const [showDeclinedTab, setShowDeclinedTab] = useState(true);
  const [storeIdToUpdate, setStoreIdToUpdate] = useState(null);
  const [showConfirmationModal, setShowConfirmationModal] = useState(false);
  const [selectedStoreId, setSelectedStoreId] = useState(null);
  const [showSuccessModal, setShowSuccessModal] = useState(false); // State to control success modal visibility
  const [adminReply, setAdminReply] = useState(""); // State for admin's reply

  // Function to fetch the list of stores
  const fetchStores = async () => {
    try {
      const response = await fetch("http://localhost:5454/api/admins/stores");
      if (!response.ok) {
        throw new Error("Failed to fetch stores");
      }
      const data = await response.json();
      setStores(data);
    } catch (error) {
      console.error("Error fetching stores:", error);
    }
  };

  // Function to handle decline action and show confirmation modal
  const handleDecline = (storeId) => {
    setSelectedStoreId(storeId);
    setShowConfirmationModal(true);
  };

  // Function to handle approval action and show success modal
  const handleApprove = async () => {
    try {
      const response = await fetch(`http://localhost:5454/api/admins/stores/${selectedStoreId}/confirm`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ status: true, reply: adminReply }), // Pass the status as true for approval
      });
      if (!response.ok) {
        throw new Error("Failed to confirm store");
      }
      setShowConfirmationModal(false); // Close confirmation modal
      setShowSuccessModal(true); // Show success modal
      fetchStores(); // Refresh the list of stores
    } catch (error) {
      console.error("Error confirming store:", error);
    }
  };

  // useEffect hook to fetch stores when the component mounts
  useEffect(() => {
    fetchStores();
  }, []);

  return (
    <>
      {/* Confirmation modal */}
      {showConfirmationModal && (
        <div className="fixed top-0 left-0 flex items-center justify-center z-50 h-full w-full bg-black bg-opacity-50">
          <div className="bg-white rounded-lg p-8 shadow-md">
            <p className="text-lg font-semibold mb-4">Accept this store name?</p>
            <textarea
              className="w-full h-20 border border-gray-300 rounded-md p-2 mb-4"
              placeholder="Reply to the admin (optional)"
              value={adminReply}
              onChange={(e) => setAdminReply(e.target.value)}
            ></textarea>
            <div className="flex justify-end">
              <button
                className="btn btn-danger mr-2"
                onClick={() => setShowConfirmationModal(false)}
              >
                Decline
              </button>
              <button
                className="btn btn-primary"
                onClick={handleApprove}
              >
                Approve
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Success modal */}
      {showSuccessModal && (
        <div className="fixed top-0 left-0 flex items-center justify-center z-50 h-full w-full bg-black bg-opacity-50">
          <div className="bg-white rounded-lg p-8 shadow-md text-center">
            <p className="text-lg font-semibold mb-4">Store Approved</p>
            <CheckCircleIcon className="w-12 h-12 text-green-500 mx-auto mb-4" />
            <button
              className="btn btn-primary w-full"
              onClick={() => setShowSuccessModal(false)}
            >
              OK
            </button>
          </div>
        </div>
      )}

      {/* Tab buttons */}
      <div className="flex justify-center space-x-4 mb-4">
        <button
          className={`bg-red-500 text-white px-4 py-2 rounded-lg ${showDeclinedTab ? 'bg-opacity-100' : 'bg-opacity-50'}`}
          onClick={() => setShowDeclinedTab(true)}
        >
          Waiting Process Stores
        </button>
      </div>

      {/* Store Declined tab */}
      {showDeclinedTab && (
        <div>
          <TitleCard title="Waiting Process Stores" topMargin="mt-2">
            <div className="overflow-x-auto w-full">
              <table className="table w-full">
                <thead>
                  <tr>
                    <td>No.</td>
                    <th>Store Name</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {stores.filter(store => store.status === false).map((store, index) => (
                    <tr key={index}>
                      <td>{store.id}</td>
                      <td>
                        <div className="flex items-center">
                          <HomeIcon className="w-6 h-6 text-gray-500 mr-2" />
                          {store.name}
                        </div>
                      </td>
                      <td>
                        {/* Button to trigger the confirmation modal */}
                        <button
                          className="text-yellow-500 hover:text-yellow-700"
                          onClick={() => handleDecline(store.id)}
                        >
                          <ExclamationCircleIcon className="w-6 h-6" />
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </TitleCard>
        </div>
      )}
    </>
  );
}

export default Stores;
