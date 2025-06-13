// Main JavaScript file for MVC application

document.addEventListener('DOMContentLoaded', function() {
    // Initialize tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Handle form submissions
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            // Here you would typically send the form data to your controller
            console.log('Form submitted:', new FormData(form));
        });
    });

    // Handle delete buttons
    const deleteButtons = document.querySelectorAll('.btn-danger');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            if (confirm('¿Está seguro de que desea eliminar este elemento?')) {
                // Here you would typically send a delete request to your controller
                console.log('Delete requested for:', this.closest('tr'));
            }
        });
    });

    // Handle search
    const searchInput = document.querySelector('input[type="text"]');
    if (searchInput) {
        searchInput.addEventListener('input', function(e) {
            // Here you would typically filter the table or send a search request
            console.log('Searching for:', e.target.value);
        });
    }

    // Handle category filter
    const categorySelect = document.querySelector('select.form-select');
    if (categorySelect) {
        categorySelect.addEventListener('change', function(e) {
            // Here you would typically filter the table or send a filter request
            console.log('Filtering by category:', e.target.value);
        });
    }
}); 