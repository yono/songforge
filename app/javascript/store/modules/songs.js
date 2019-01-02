import axios from '../axios'

const state = {
  all: []
}

const getters = {}

const actions = {
  getAllSongs ({ commit }) {
    //const songs = axios.get('/songs.json')
    const songs = [
      {"id":1,"name":"曲名テスト","artist_id":1,"last_sang_at":"2018-08-27T16:14:57.216+09:00","created_at":"2018-08-27T16:14:35.397+09:00","updated_at":"2018-08-27T16:14:57.222+09:00","movie_url":"","pinned_at":null},
      {"id":2,"name":"テスト","artist_id":null,"last_sang_at":"2018-09-02T01:58:58.782+09:00","created_at":"2018-09-02T01:48:46.837+09:00","updated_at":"2018-09-02T01:58:58.796+09:00","movie_url":"","pinned_at":null}
    ]
    commit('setSongs', songs)
  }
}

const mutations = {
  setSongs (state, songs) {
    state.all = songs
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
