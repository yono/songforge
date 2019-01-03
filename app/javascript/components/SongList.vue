<template>
  <div>
    <template v-if="fetched">
      <pull-to :top-load-method="refresh" :top-config="topConfig">
        <swipe-list class="card" :items="songs" transition-key="id">
          <template slot-scope="{ item, index, revealLeft, revealRight, close }">
            <div class="card-content">
              <span>{{ item.name }}</span><br/>
              <span>{{ item.id }}</span>
            </div>
          </template>
          <template slot="right" slot-scope="{ item }">
            <div class="swipeout-action red">
              <span>ごみばこ</span>
            </div>
          </template>
        </swipe-list>
      </pull-to>
    </template>
    <template v-else>
      <span>読み込み中……</span>
    </template>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import { SwipeList, SwipeOut } from 'vue-swipe-actions'
import PullTo from 'vue-pull-to'
import 'vue-swipe-actions/dist/vue-swipe-actions.css'

// TODO: fetched はローカルステートにする（store に持たせるの微妙かもしれない）
export default {
  components: {
    SwipeList,
    SwipeOut,
    PullTo,
  },
  computed: mapState({
    songs: state => state.songs.all,
    fetched: state => state.songs.fetched,
    topConfig: state => state.songs.topConfig,
  }),
  created () {
    this.$store.dispatch('songs/fetchAllSongs')
  },
  methods: {
    refresh(loaded) {
      this.$store.dispatch('songs/reloadAllSongs')
      loaded('done')
    }
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
