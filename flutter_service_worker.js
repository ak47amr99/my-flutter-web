'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "c95660c19f75f11dea09c19eb60abd5a",
"assets/AssetManifest.bin.json": "b7885bc8595926dc70c61eba9320cbe4",
"assets/AssetManifest.json": "f5f83dce65f5150cc7e673be4588a857",
"assets/assets/americanshorthair.jpg": "a404fc86c3dc32d325d1171f2df19274",
"assets/assets/bombaycat.jpg": "bac3719cdb1b44f2efb4191669fe03d8",
"assets/assets/Border%2520Collie.jpg": "1c624b3228d5211fcb71cae971f7168b",
"assets/assets/Boxer.jpg": "bd2769b5146f3596f5d0d27f056e5692",
"assets/assets/british-shorthair-1.jpg": "10a26803f74a40caf8742583a4345494",
"assets/assets/bulldog.jpg": "d35af01af0d789b3dbe7b694737ed0d1",
"assets/assets/capybara.jpg": "6eed0df4e62cc3fff5a3bdf3d770201e",
"assets/assets/catbadge.png": "6343f4658ec377f5efdbb44299c91aa9",
"assets/assets/chihuahua.jpg": "32e7d42298202cbab6c05d118346fcb6",
"assets/assets/Crocodile.jpg": "79c851caec8583be545c935630776c74",
"assets/assets/Dachshund.jpg": "41421f41f9db021681d917bba0627042",
"assets/assets/dogegg.png": "f538c42748849b880ac3826bc7fec499",
"assets/assets/egg.png": "430bac2d7bcfdf37bf1ccf1da5af8793",
"assets/assets/germanshepherd.jpg": "cae2c666bf22fc88e71edf27fc1b5943",
"assets/assets/giraffe.jpg": "228449565bed003a549fd7e5dfd8d1b0",
"assets/assets/golden.jpeg": "5f36fb3a2dbd3514c8392976c5ba4988",
"assets/assets/husky.jpg": "4f2e00142abdf0c339aba92bf74f955c",
"assets/assets/jungle_egg.png": "7241e9c886cf9023b93f065c4edb47f0",
"assets/assets/Labrador.jpg": "47159e9a571312bbc7cf7d1cea4a37a1",
"assets/assets/lion.jpg": "31649efbc1a48c85886661947767378c",
"assets/assets/maine_coon_giant.jpg": "4db01549d4e5494e5826307d382020be",
"assets/assets/Maltese%2520dog.jpg": "4b27c32732f757ffa61a82cb16b31323",
"assets/assets/monkey.jpg": "a0b9e9ac06fdedb38d6ff4da9c78d9b1",
"assets/assets/munchkincat.jpg": "7665bf1324470687facca2b7606ea196",
"assets/assets/panther.jpg": "601e62ce03259baa24f8f6913c90c958",
"assets/assets/parrot.jpg": "f7fcfc7f132353cc55da1e35e64264e0",
"assets/assets/persian_long_hair_2.jpg": "3327d1e157f2103d6d310e79199ef8c6",
"assets/assets/poodle.jpg": "69379034008bf17f618859cf7d34e3fe",
"assets/assets/rhino.jpg": "ab5f14b46357741563ac0ac370cb804e",
"assets/assets/russianblue.jpg": "a27c56fab80ccb5c63d8b6cdcda8eb4b",
"assets/assets/siamese_1.jpg": "25acfd1fb9a061b0777e1e4367ae82f1",
"assets/assets/siberiancat.jpg": "8aae14ee221411e538664bb7c323dc53",
"assets/assets/Sphynx1.jpg": "92a8240b20635736c3f1961896d0e2bd",
"assets/assets/tiger.jpg": "2cf45cd3594858b64a5de1de2561babc",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "29918bcc0226f96be3f2a31066ece6f9",
"assets/NOTICES": "eda5ce7af283ad712aebd046a1d1d1e2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "13d2714b5ab55301b45d4aa5550420ac",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "8bc52fc81fcb080ff2e087d232c38326",
"/": "8bc52fc81fcb080ff2e087d232c38326",
"main.dart.js": "3c2c0dd7eb52eec16bd14998b79489b9",
"manifest.json": "e76c29bdf9c2361fc8197ce57d5e27a2",
"version.json": "2a56002e687f1f0a0cfba93e679b1eff"};
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
