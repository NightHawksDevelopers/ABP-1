document.addEventListener("DOMContentLoaded", function() {

    const currentUrl = encodeURIComponent(window.location.href);
    const pageTitle = encodeURIComponent(document.title);

 
    const facebookBtn = document.getElementById('share-facebook');
    const linkedinBtn = document.getElementById('share-linkedin');

  
    if (facebookBtn) {
        facebookBtn.href = `https://www.facebook.com/sharer/sharer.php?u=${currentUrl}`;
    }

    if (linkedinBtn) {
        linkedinBtn.href = `https://www.linkedin.com/sharing/share-offsite/?url=${currentUrl}`;
    }


});