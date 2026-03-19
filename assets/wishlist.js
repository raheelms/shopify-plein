class WishlistManager {
  constructor() {
    this.storageKey = 'cleanandcare_wishlist';
    this.wishlist = this.getWishlist();
    this.init();
  }

  getWishlist() {
    const stored = localStorage.getItem(this.storageKey);
    return stored ? JSON.parse(stored) : [];
  }

  saveWishlist() {
    localStorage.setItem(this.storageKey, JSON.stringify(this.wishlist));
    this.updateHeaderCount();
  }

  toggle(handle, button) {
    const index = this.wishlist.indexOf(handle);
    if (index === -1) {
      this.wishlist.push(handle);
      button.classList.add('is-active');
    } else {
      this.wishlist.splice(index, 1);
      button.classList.remove('is-active');
    }
    this.saveWishlist();
  }

  init() {
    document.addEventListener('DOMContentLoaded', () => {
      this.updateHeaderCount();
      this.setupButtons();
    });

    // Re-run on dynamic reloads (like search filters) if needed
    document.addEventListener('shopify:section:load', () => this.setupButtons());
  }

  setupButtons() {
    const buttons = document.querySelectorAll('.card__wishlist');
    buttons.forEach(btn => {
      const handle = btn.dataset.productHandle;
      if (!handle) return;

      // Set initial state
      if (this.wishlist.includes(handle)) {
        btn.classList.add('is-active');
      } else {
        btn.classList.remove('is-active');
      }

      // Add click listener (preventing default if it's inside a link)
      btn.onclick = (e) => {
        e.preventDefault();
        e.stopPropagation();
        this.toggle(handle, btn);
      };
    });
  }

  updateHeaderCount() {
    const countBubble = document.querySelector('.wishlist-count-bubble');
    if (countBubble) {
      countBubble.textContent = this.wishlist.length;
      countBubble.style.display = this.wishlist.length > 0 ? 'flex' : 'none';
    }
  }
}

window.Wishlist = new WishlistManager();
