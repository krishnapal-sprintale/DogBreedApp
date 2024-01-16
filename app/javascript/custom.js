  document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("dog-breed-form").addEventListener("submit", function(e) {
      e.preventDefault();
      var formAction = this.getAttribute("action");
      var formData = new FormData(this);
      
      // Convert formData to URL-encoded query parameters
      var params = new URLSearchParams(formData).toString();

      // Append the parameters to the URL
      fetch(formAction + '?' + params, {
        method: 'GET',
        headers: {
          'X-CSRF-Token': '<%= form_authenticity_token %>'
        }
      })
      .then(response => response.json())
      .then(data => {
        if (data.dog_breed_name && data.dog_image) {
          displayDogImage(data.dog_breed_name, data.dog_image);
        } else {
          displayErrorMessage('Breed not found.');
        }
      })
      .catch(error => console.error('Error:', error));
    });
  });

  function displayDogImage(breed, imageUrl) {
    const resultContainer = document.getElementById('dog-breed-result');
    resultContainer.innerHTML = `
      <h2>Result: ${breed}</h2>
      <img id="dogImage" src="${imageUrl}" alt="Dog Image">
    `;
  }

  function displayErrorMessage(message) {
    const resultContainer = document.getElementById('dog-breed-result');
    resultContainer.innerHTML = `<p class="text-danger">${message}</p>`;
  }
