import React, { useEffect, useState } from "react";
import TitleCard from "../../components/Cards/TitleCard";
import ReadMoreText from "../../components/Typography/ReadMoreText";
import Modal from "../../components/Input/Modal"; // Import Modal component
import {
  CheckCircleIcon,
  HomeIcon,
  XCircleIcon,
} from "@heroicons/react/24/solid";
import { HiDotsVertical } from "react-icons/hi";

function Variants() {
  const [variants, setVariants] = useState([]);
  const [selectedVariant, setSelectedVariant] = useState(null);
  const [variantImages, setVariantImages] = useState([]);
  const [searchTerm, setSearchTerm] = useState(""); // State for search term
  const [sortDirection, setSortDirection] = useState(""); // State for sort direction
  const [showModal, setShowModal] = useState(false); // State for modal visibility
  const [confirmationModal, setConfirmationModal] = useState(false); // State for confirmation modal visibility
  const [requestAcceptedModal, setRequestAcceptedModal] = useState(false); // State for request accepted modal visibility

  // Function to fetch the list of variants
  const fetchVariants = async () => {
    try {
      const response = await fetch("http://localhost:5454/api/admins/variants");
      if (!response.ok) {
        throw new Error("Failed to fetch variants");
      }
      const data = await response.json();
      // Filter out declined and approved variants
      const filteredVariants = data.filter(
        (variant) =>
          variant.status !== "Declined" && variant.status !== "Approved"
      );
      setVariants(filteredVariants);
    } catch (error) {
      console.error("Error fetching variants:", error);
    }
  };

  // Function to fetch images of a variant
  const fetchVariantImages = async (variantId) => {
    try {
      const response = await fetch(
        `http://localhost:5454/api/admins/variants/${variantId}/images`
      );
      if (!response.ok) {
        throw new Error("Failed to fetch variant images");
      }
      const data = await response.json();
      setVariantImages(data);
      setShowModal(true); // Show modal after fetching images
    } catch (error) {
      console.error("Error fetching variant images:", error);
    }
  };

  // Function to confirm all images of a variant
  const confirmAllImages = async (variantId) => {
    try {
      const response = await fetch(
        `http://localhost:5454/api/admins/variants/${variantId}/confirmAllImages`,
        {
          method: "POST",
        }
      );
      if (!response.ok) {
        throw new Error("Failed to confirm all images");
      }
      // Remove the confirmed variant from the list
      const updatedVariants = variants.filter(
        (variant) => variant.id !== variantId
      );
      setVariants(updatedVariants);
      setRequestAcceptedModal(true); // Show request accepted modal
      setShowModal(false); // Close confirmation modal
    } catch (error) {
      console.error("Error confirming all images:", error);
    }
  };

  // useEffect hook to fetch variants when the component mounts
  useEffect(() => {
    fetchVariants();
  }, []);

  // Function to filter variants based on search term
  const filteredVariants = variants.filter((variant) =>
    variant.name.toLowerCase().includes(searchTerm.toLowerCase())
  );

  // Function to handle action on variant click
  const handleVariantClick = (variantId) => {
    setSelectedVariant(variantId);
    fetchVariantImages(variantId);
  };

  // Function to handle closing modal
  const handleCloseModal = () => {
    setShowModal(false);
    setRequestAcceptedModal(false);
  };

  // Function to handle declining request
  const handleDeclineRequest = () => {
    // Your logic to handle declining request
    setShowModal(false);
    setConfirmationModal(false);
  };

  // Function to sort variants by name

  return (
    <>
      {/* Search input */}
      <div className="flex justify-end items-center mb-4">
        <input
          type="text"
          placeholder="Search variants..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
        />
      </div>

      {/* Variant list */}
      <TitleCard title="Variants" topMargin="mt-2">
        <div className="overflow-x-auto w-full">
          <table className="table w-full">
            <thead>
              <tr>
                <th>No.</th>
                <th>SkuCode</th>
                <th>Product</th>
                <th>Name</th>
                <th>Image Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {filteredVariants.map((variant, index) => (
                <tr key={index}>
                  <td>{variant.id}</td>
                  <td className="bg-gray-200 px-4 py-2 rounded-md">{variant.skuCode}</td>
                  <td>{variant.productDTO.title}</td>
                  <td>
                    <ReadMoreText text={variant.name} maxLength={30} />
                  </td>
                  <td>
                    <td>
                      {variant.imageDTOList.some((image) => image.status) ? (
                        <CheckCircleIcon className="text-green-500 h-5 w-5" />
                      ) : (
                        <XCircleIcon className="text-red-500 h-5 w-5" />
                      )}
                    </td>
                  </td>
                  <td>
                    <HiDotsVertical
                      className="h-6 w-6 text-gray-500 cursor-pointer"
                      onClick={() => handleVariantClick(variant.id)}
                    />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </TitleCard>

      {/* Modal for variant images */}
      {showModal && (
        <Modal onClose={handleCloseModal}>
          <div className="text-center">
            <h2 className="text-lg font-bold">Confirm Variant Images</h2>
            <p className="mt-2">Variant Title: {selectedVariant}</p>
            {/* Render variant images */}
            <div className="flex justify-center items-center mt-4">
              {variantImages.map((image, index) => (
                <img
                  key={index}
                  src={image.imgPath}
                  alt={`Image ${index + 1}`}
                  className="w-24 h-24 object-cover mx-2"
                />
              ))}
            </div>
            {/* Confirm and Decline buttons */}
            <div className="flex justify-center mt-4 space-x-4">
              <button
                className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:bg-blue-700"
                onClick={() => confirmAllImages(selectedVariant)}
              >
                Confirm
              </button>
              <button
                className="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 focus:outline-none focus:bg-red-700"
                onClick={handleDeclineRequest}
              >
                Decline
              </button>
            </div>
            {/* Close button */}
            <button
              className="block w-full mt-4 px-4 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400 focus:outline-none focus:bg-gray-400"
              onClick={handleCloseModal}
            >
              Close
            </button>
          </div>
        </Modal>
      )}

      {/* Request accepted modal */}
      {requestAcceptedModal && (
        <Modal onClose={handleCloseModal}>
          <div className="text-center">
            <h2 className="text-lg font-bold">Request Accepted</h2>
            <p className="mt-2">Your request has been accepted.</p>
            {/* Close button */}
            <button
              className="block w-full mt-4 px-4 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400 focus:outline-none focus:bg-gray-400"
              onClick={handleCloseModal}
            >
              Close
            </button>
          </div>
        </Modal>
      )}
    </>
  );
}
export default Variants;
