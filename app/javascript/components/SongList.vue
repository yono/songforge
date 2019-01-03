<template>
  <div>
    <swipe-list class="card" :items="songs" transition-key="id">
      <template slot-scope="{ item, index, revealLeft, revealRight, close }">
        <div class="card-content">
          <span>{{ item.name }}</span>
        </div>
      </template>
      <template slot="right" slot-scope="{ item }">
        <div class="swipeout-action red">
          <span>ごみばこ</span>
        </div>
      </template>
    </swipe-list>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import { SwipeList, SwipeOut } from 'vue-swipe-actions'
import 'vue-swipe-actions/dist/vue-swipe-actions.css'

export default {
  components: {
    SwipeList,
    SwipeOut,
  },
  computed: mapState({
    songs: state => state.songs.all
  }),
  created () {
    this.$store.dispatch('songs/getAllSongs')
  }
}
</script>

<style>
.swipeout-list {
	display: flex;
	flex-direction: column;
}
.swipeout-action {
  display: flex;
  align-items: center;
  padding: 0 3rem;
  cursor: pointer;
  left: 0;
  // https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/
  &.blue {
    color: white;
    background-color: rgb(0,122,255);
      &:hover {
        background-color: darken(rgb(0,122,255), 5%);
      }
  }
  &.purple {
    color: white;
    background-color: rgb(88,86,214);
      &:hover {
      background-color: darken(rgb(88,86,214), 5%);
      }
  }
  &.red {
    color: white;
    background-color: rgb(255,59,48);
      &:hover {
      background-color: darken(rgb(255,59,48), 5%);
      }
  }
  &.green {
    color: white;
    background-color: rgb(76,217,100);
      &:hover {
      background-color: darken(rgb(76,217,100), 5%);
      }
  }
}
.swipeout-list-item {
	flex: 1;
	border-bottom: 1px solid lightgray;
	&:last-of-type {
		border-bottom: none;
	}
}
.card {
  width: 100%;
	background-color: white;
	border-radius: 3px;
	box-shadow: none;
	border: 1px solid lightgray;
}
.card-content {
  padding: 1rem;
}
</style>
