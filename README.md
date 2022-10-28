# rickAndMortySwiftApi

## Rick And Morty API for swift

### Access point

Use `RAMApi` for access to services

```swift
let ramApi = RAMApi()

ramApi.charactes.getAll(page: 1) { result in
 if case .success(let characters) = result {
  print(characters)
 }
}
```

Use `locations` or `episode` for other items requests

### Request item by id, ids or filter

Use request by id for specific item or use bunch of ids for several items

```swift
ramApi.locations.getLocation(id: 1) { result in
// do some stuff
}

ramApi.episodes.getEpisodes(ids: [1, 5]) { result in
// do some stuff
}

let filter = RAMCharacterFilter(name: "Rick")
ramApi.characters.getCharacters(page: 0, filter: filter) { result in
// do some stuff
}
```

### Use URLSessionTask for requests control

Each request returning `URLSessionTask` which can be used for canceling request
if it's nessesary

```swift
let task = ramApi.locations.getLocation(id: 1) { _ in }
task.cancel()
```
