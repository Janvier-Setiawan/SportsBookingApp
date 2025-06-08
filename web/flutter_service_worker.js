self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open('coba_shuttlego3-cache').then((cache) => {
      return cache.addAll([
        '/',
        'index.html',
        'main.dart.js',
        'manifest.json',
        'icons/Icon-192.png',
        'icons/Icon-512.png',
      ]);
    })
  );
});

self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});