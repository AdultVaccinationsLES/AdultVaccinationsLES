'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "63714825299bdabcba56547c3bdd3b47",
"assets/AssetManifest.bin.json": "2b4ec1d8df896dccbd062e8be05c80b2",
"assets/AssetManifest.json": "dd882bbe6917165bf860998d41fd81ca",
"assets/assets/images/AppleSoda.jpg": "a351b97a886de16f5f905905283ce318",
"assets/assets/images/button_1.jpeg": "b893b673fd482d71f3da5d878bb1d288",
"assets/assets/images/button_2.jpeg": "dec5ddaf64cf1e2729881d66c475a938",
"assets/assets/images/efnep.jpg": "8f75eac2f4d6c27992e5d6e5f09bd0a3",
"assets/assets/images/EFNEP_infographic_back.png": "d734bc67a397d198ab973f0d1fb20e0d",
"assets/assets/images/EFNEP_infographic_front.png": "b9e55432f9369265291e7b0f56915993",
"assets/assets/images/EXCITE_logo.png": "4902db25109ff4a40a86f0f2c4889164",
"assets/assets/images/FaC.jpg": "fbc61712a9bddcc068abdfe038214529",
"assets/assets/images/MainBanner.jpg": "2c48f3ab549da4d03dac66983c74642e",
"assets/assets/images/map_sample.png": "260a9ad2ef6650e8f767e9f816da6de3",
"assets/assets/images/maryland_banner_map.png": "4f925822af503f6b5abe589b9748ea89",
"assets/assets/images/PopeyePowerSmoothi.jpg": "6cfc2e8876764dd237f596087fbad41d",
"assets/assets/images/UMES_EXTENSION_LOGO.png": "455289f5a0c5750fee6a5b81668f8299",
"assets/assets/images/UMES_LOGO.png": "c6556f6d8025555a74aa6f60d2548432",
"assets/assets/images/Vaccine_FS.jpg": "f3a5032d2982b37385fd705a348bbd6a",
"assets/assets/images/vacc_3.jpg": "f750276dbbf2b8d1467859fb3ffdcd6e",
"assets/assets/images/vacc_banner_2.jpg": "26da81843ed5e06c4756ea3f494cf387",
"assets/assets/images/vacc_banner_3.jpg": "5c80155b4523111567e5ba9be1da45a8",
"assets/assets/images/vacc_banner_FAQ.jpg": "1790a3ec97f96cab28d0b8bc2702b1d1",
"assets/assets/images/WtK.jpg": "23d39b070da242ef5e222ce3a5fb0c47",
"assets/assets/images/YogurtRanch.jpg": "7060b06b474a2dfb68c828134ee8ce6e",
"assets/assets%255Cimages%255Cbutton_1.jpeg": "b893b673fd482d71f3da5d878bb1d288",
"assets/assets%255Cimages%255Cbutton_2.jpeg": "dec5ddaf64cf1e2729881d66c475a938",
"assets/assets%255Cimages%255Cefnep.jpg": "8f75eac2f4d6c27992e5d6e5f09bd0a3",
"assets/assets%255Cimages%255CEXCITE_logo.png": "4902db25109ff4a40a86f0f2c4889164",
"assets/assets%255Cimages%255Cmap_sample.png": "260a9ad2ef6650e8f767e9f816da6de3",
"assets/assets%255Cimages%255Cmaryland_banner_map.png": "4f925822af503f6b5abe589b9748ea89",
"assets/assets%255Cimages%255CUMES_EXTENSION_LOGO.png": "455289f5a0c5750fee6a5b81668f8299",
"assets/assets%255Cimages%255CUMES_LOGO.png": "c6556f6d8025555a74aa6f60d2548432",
"assets/assets%255Cimages%255Cvacc_3.jpg": "f750276dbbf2b8d1467859fb3ffdcd6e",
"assets/assets%255Cimages%255Cvacc_banner_2.jpg": "26da81843ed5e06c4756ea3f494cf387",
"assets/assets%255Cimages%255Cvacc_banner_3.jpg": "5c80155b4523111567e5ba9be1da45a8",
"assets/assets%255Cimages%255Cvacc_banner_FAQ.jpg": "1790a3ec97f96cab28d0b8bc2702b1d1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "0d24460888c4bc3ac9563afe53a94487",
"assets/NOTICES": "66cdf675157615d0f387c7793e5f87b3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "19c8dca83ca766db22dd03d0d4657eb7",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "f2ce737e8eba97032ff5aa9a2cc6bfcc",
"/": "f2ce737e8eba97032ff5aa9a2cc6bfcc",
"main.dart.js": "b9c490a605069524e199e0db0699c437",
"manifest.json": "bf24c84c3bf99672a631c4f84464e793",
"version.json": "15235b5108d6a877ef74fe3317a96bf7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
