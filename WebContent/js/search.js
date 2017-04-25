/**
 * Created by congp on 01-Dec-16.
 */
$(document).ready(function () {
    var timeout;
    var delay = 300;
    $("#search").on({
        focus: function () {
            if ($(this).val() != '')
                $("#search-popup").css("display", "block");
        },
        blur: function () {
            //$("#search-popup").css("display", "none");
        },
        keyup: function () {
            var key = $(this).val();
            if ( key!= '') {
                clearTimeout(timeout);
                timeout = setTimeout(function () {
                    search(key);
                }, delay);
            } else {
                $("#search-popup").css("display", "none");
            }
        }
    });
});
function search(key) {
    $.get('http://localhost:8080/MusicWeb/SearchController', {key: key}, function (data, status) {
        $("#search-popup").css("display", "block");
        var songSize = Object.keys(data.songs).length;
        var ul = document.getElementById("search-list");
        ul.innerHTML = '';
        for (var i = 0; i < songSize; i++) {
            var li = document.createElement("li");
            li.innerHTML = '<span class="glyphicon glyphicon-music" aria-hidden="true"></span> <a href=\"/nhac/' + data.songs[i].slugSong + '\">' + data.songs[i].nameSong + '</a>';
            ul.appendChild(li);
        }
        var albumSize = Object.keys(data.albums).length;
        for (var i = 0; i < albumSize; i++) {
            var li = document.createElement("li");
            li.innerHTML = '<span class="glyphicon glyphicon-cd" aria-hidden="true"></span> <a href=\"/album/' + data.albums[i].slugAlbum + '\">' + data.albums[i].nameAlbum + '</a>';
            ul.appendChild(li);
        }
        var playlistSize = Object.keys(data.playlist).length;
        for (var i = 0; i < playlistSize; i++) {
            var li = document.createElement("li");
            li.innerHTML = '<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <a href=\"/playlist/' + data.playlist[i].slugPlaylist + '\">' + data.playlist[i].namePlaylist + '</a>';
            ul.appendChild(li);
        }
    });
}

