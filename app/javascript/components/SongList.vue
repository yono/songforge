<template>
  <ul>
    <li v-for="song in songs" :key="song.id">
      {{ song.name }}
    </li>
  </ul>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: mapState({
    songs: state => state.songs.all
  }),
  created () {
    this.$store.dispatch('songs/getAllSongs')
  }
}
</script>
