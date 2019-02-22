###
  Store `storage` object in `localStorage`, LZ compressed to Base 64.
  @example
  // Initialize storage in localStorage, called the first `get` or `set`
  storage.init()
  @example
  // Remove a key value pair or clear whole object
  storage.clear([key])
  @example
  // Set a value for a key
  storage.set(key, value)
  @example
  // Get a key's value or whole object
  storage.get(key)
  @example
  // Low level compression and storage
  storage.store(obj)
###
storage = {
  init: () ->
    if !localStorage.getItem("storage")? then storage.store {
      "created": new Date()
      "version": '{{ site.github.latest_release.tag_name }}'
      "url": '{{ site.url }}'
      "repository": '{{ site.github.repository_url }}'
    }
    true
  clear: (key) ->
    obj = storage.get()
    if key?
      delete obj[key]
      storage.store obj
    else
      localStorage.removeItem 'storage'
    true
  set: (key, value) ->
    if !localStorage.getItem("storage")? then storage.init()
    obj = storage.get()
    if key? and value?
      obj[key] = value
      storage.store obj
      return storage
    else
      return false
  get: (key) ->
    if !localStorage.getItem("storage")? then storage.init()
    if key?
      storage.get()[key]
    else
      JSON.parse LZString.decompressFromBase64 localStorage.getItem "storage"
  store: (obj) ->
    localStorage.setItem 'storage', LZString.compressToBase64 JSON.stringify obj
}
