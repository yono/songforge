import axios from '../axios'

const state = {
  all: [],
  fetched: false,
}

const getters = {}

const actions = {
  fetchAllSongs ({ commit }) {
    commit('fetching')
    axios.get('/songs.json').then(function(response) {
      commit('setSongs', response.data)
      commit('fetched')
    })
  },
  reloadAllSongs ({ commit }) {
    axios.get('/songs.json').then(function(response) {
      commit('setSongs', response.data)
    })
  }
}

const mutations = {
  setSongs (state, songs) {
    state.all = songs
  },
  fetching (state) {
    state.fetched = false
  },
  fetched (state) {
    state.fetched = true
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
