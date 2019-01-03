<template>
  <div id="app">
    <div id="header">
      <h2>SongForge</h2>
    </div>
    <div id="body">
      <SongList/>
    </div>
    <div id="footer">
      <span>footer</span>
    </div>
  </div>
</template>

<script>
import SongList from './SongList.vue'

export default {
  components: { SongList }
}
</script>

<style>
div#header {
  position: sticky;
  top: 0px;
  bottom: 0px;
  left: 0px;
  width: 100%;
  background-color: #999;
  z-index: 1;
}

div#header> h2 {
  margin-bottom: 0;
}

div#footer {
  position: sticky;
  z-index: 1;
  bottom: 0;
  background-color: #999;
}

div#body {
}
</style>
