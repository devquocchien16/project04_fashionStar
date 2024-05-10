import React, { useEffect, useState } from "react";
import TitleCard from "../../components/Cards/TitleCard";
import Modal from "../../components/Input/Modal";
import {
  CheckCircleIcon,
  HomeIcon,
  XCircleIcon,
} from "@heroicons/react/24/solid";
import { Link } from "react-router-dom";

function Products() {
  const [products, setProducts] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [adminReply, setAdminReply] = useState("");
  const [confirmAction, setConfirmAction] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [sortDirection, setSortDirection] = useState("");
  const [productIdToUpdate, setProductIdToUpdate] = useState(null);
  // Function to fetch the list of products
  const fetchProducts = async () => {
    try {
      const response = await fetch("http://localhost:5454/api/admins/products");
      if (!response.ok) {
        throw new Error("Failed to fetch products");
      }
      const data = await response.json();
      setProducts(data);
    } catch (error) {
      console.error("Error fetching products:", error);
    }
  };

  // Function to handle updating product status
  const handleUpdateStatus = async (productId, status) => {
    try {
      const response = await fetch(
        `http://localhost:5454/api/admins/products/${productId}/confirm`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ status }),
        }
      );
      if (!response.ok) {
        throw new Error("Failed to update product status");
      }
      // Fetch products after successful update
      fetchProducts();
    } catch (error) {
      console.error("Error updating product status:", error);
    }
  };

  // Function to handle approval action
  const handleApprove = (productId) => {
    setConfirmAction("approve");
    setShowModal(true);
  };

  // Function to handle decline action
  const handleDecline = (productId) => {
    setConfirmAction("decline");
    setShowModal(true);
  };

  // Function to handle form submission
  const handleSubmit = () => {
    if (confirmAction === "approve") {
      handleUpdateStatus(productIdToUpdate, true);
    } else if (confirmAction === "decline") {
      handleUpdateStatus(productIdToUpdate, false);
    }
    // Reset form state
    setShowModal(false);
    setAdminReply("");
    setConfirmAction(null);
  };

  // Function to filter products based on search term
  const filteredProducts = products.filter((product) =>
    product.title.toLowerCase().includes(searchTerm.toLowerCase())
  );

  // Function to sort products by createdAt
  const sortedProducts = [...filteredProducts].sort((a, b) => {
    if (sortDirection === "asc") {
      return new Date(a.createdAt) - new Date(b.createdAt);
    }
    return 0;
  });

  // Function to toggle sort direction
  const toggleSortDirection = () => {
    if (sortDirection === "asc") {
      setSortDirection("");
    } else {
      setSortDirection("asc");
    }
  };

  // Function to sort products by title
  const sortProductsByTitle = () => {
    const direction = sortDirection === "asc" ? "desc" : "asc";
    setSortDirection(direction);
    const sorted = [...filteredProducts].sort((a, b) => {
      const titleA = a.title.toUpperCase();
      const titleB = b.title.toUpperCase();
      if (direction === "asc") {
        return titleA < titleB ? -1 : titleA > titleB ? 1 : 0;
      } else {
        return titleA > titleB ? -1 : titleA < titleB ? 1 : 0;
      }
    });
    setProducts(sorted);
  };

  // Function to sort products by createdAt
  const sortProductsByCreatedAt = () => {
    const direction = sortDirection === "asc" ? "desc" : "asc";
    setSortDirection(direction);
    const sorted = [...filteredProducts].sort((a, b) => {
      const dateA = new Date(a.createdAt);
      const dateB = new Date(b.createdAt);
      if (direction === "asc") {
        return dateA - dateB;
      } else {
        return dateB - dateA;
      }
    });
    setProducts(sorted);
  };

  // Function to sort products by store name
  const sortProductsByStoreName = () => {
    const direction = sortDirection === "asc" ? "desc" : "asc";
    setSortDirection(direction);
    const sorted = [...filteredProducts].sort((a, b) => {
      const storeNameA = a.storeDTO.name.toUpperCase();
      const storeNameB = b.storeDTO.name.toUpperCase();
      if (direction === "asc") {
        return storeNameA < storeNameB ? -1 : storeNameA > storeNameB ? 1 : 0;
      } else {
        return storeNameA > storeNameB ? -1 : storeNameA < storeNameB ? 1 : 0;
      }
    });
    setProducts(sorted);
  };

  // Function to toggle description visibility
  const toggleDescription = (index) => {
    const updatedProducts = [...products];
    updatedProducts[index].showDescription = !updatedProducts[index].showDescription;
    setProducts(updatedProducts);
  };
  const getStatusIcon = (status) => {
    return status ? (
      <CheckCircleIcon className="w-6 h-6 text-green-500" />
    ) : (
      <XCircleIcon className="w-6 h-6 text-red-500" />
    );
  };
  // useEffect hook to fetch products when the component mounts
  useEffect(() => {
    fetchProducts();
  }, []);

  return (
    <>
          <nav className="flex justify-start items-center mb-4">
        <Link to="/products" className="text-blue-500 hover:underline">
          Products
        </Link>
        <span className="mx-2">{'>'}</span>
        <span className="font-semibold">Variant</span>
      </nav>
      {/* Search input */}
      <div className="flex justify-end items-center mb-4">
        <input
          type="text"
          placeholder="Search products..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
        />
      </div>

      {/* Product list */}
      <TitleCard title="Products Process" topMargin="mt-2">
        <div className="overflow-x-auto w-full">
          <table className="table w-full">
            <thead>
              <tr>
                <th onClick={sortProductsByTitle}>Title</th>
                <th>Description</th>
                <th>Main Picture</th>
                <th>Status</th>
                <th onClick={sortProductsByCreatedAt}>CreatedAt</th>
                <th onClick={sortProductsByStoreName}>From Store</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {sortedProducts.map((product, index) => (
                <tr key={index}>
                  <td>{product.title}</td>
                  <td>
                    <button
                      className="text-blue-500 hover:text-blue-700"
                      onClick={() => toggleDescription(index)}
                    >
                      {product.showDescription ? "Hide" : "Show"} Description
                    </button>
                    {product.showDescription && (
                      <p className="mt-2">{product.description}</p>
                    )}
                  </td>
                  <td>
                    <img
                      src={product.mainPicture}
                      alt="Main Picture"
                      className="w-20 h-20 object-cover"
                    />
                  </td>
                  <td>{getStatusIcon(product.status)}</td>
                  <td>{product.createdAt}</td>
                  <td>
                    <div className="flex items-center">
                      <HomeIcon className="w-6 h-6 text-gray-500 mr-2" />
                      {product.storeDTO.name}
                    </div>
                  </td>
                  <td>
                    <button
                      className="text-green-500 hover:text-green-700"
                      onClick={() => handleApprove(product.id)}
                    >
                      Confirm
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </TitleCard>

      {/* Modal for confirmation */}
      {showModal && (
        <Modal onClose={() => setShowModal(false)} onConfirm={handleSubmit}>
          <div className="text-center">
            <h2 className="text-lg font-bold">Confirm Product</h2>
            <p className="mt-2">
              {confirmAction === "approve"
                ? "Are you sure you want to approve this product?"
                : "Are you sure you want to decline this product?"}
            </p>
            <textarea
              className="block w-full px-4 py-2 mt-4 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500 resize-none"
              rows="4"
              value={adminReply}
              onChange={(e) => setAdminReply(e.target.value)}
              placeholder="Enter admin reply"
            ></textarea>
            <div className="flex justify-center mt-4 space-x-4">
              <button
                className="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 focus:outline-none focus:bg-green-700"
                onClick={handleSubmit}
              >
                {confirmAction === "approve" ? "Approve" : "Decline"}
              </button>
              <button
                className="px-4 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400 focus:outline-none focus:bg-gray-400"
                onClick={() => setShowModal(false)}
              >
                Cancel
              </button>
            </div>
          </div>
        </Modal>
      )}
    </>
  );
}

export default Products;
