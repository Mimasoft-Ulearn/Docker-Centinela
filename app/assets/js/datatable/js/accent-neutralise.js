/**
 * When search a table with accented characters, it can be frustrating to have
 * an input such as _Zurich_ not match _Zürich_ in the table (`u !== ü`). This
 * type based search plug-in replaces the built-in string formatter in
 * DataTables with a function that will remove replace the accented characters
 * with their unaccented counterparts for fast and easy filtering.
 *
 * Note that with the accented characters being replaced, a search input using
 * accented characters will no longer match. The second example below shows
 * how the function can be used to remove accents from the search input as well,
 * to mitigate this problem.
 *
 *  @summary Replace accented characters with unaccented counterparts
 *  @name Accent neutralise
 *  @author Allan Jardine
 *
 *  @example
 *    $(document).ready(function() {
 *        $('#example').dataTable();
 *    } );
 *
 *  @example
 *    $(document).ready(function() {
 *        var table = $('#example').dataTable();
 *
 *        // Remove accented character from search input as well
 *        $('#myInput').keyup( function () {
 *          table
 *            .search(
 *              jQuery.fn.DataTable.ext.type.search.string( this.value )
 *            )
 *            .draw()
 *        } );
 *    } );
 */

(function(){

function removeAccents ( data ) {
    return data
        .replace( /έ/g, 'ε' )
        .replace( /[ύϋΰ]/g, 'υ' )
        .replace( /ό/g, 'ο' )
        .replace( /ώ/g, 'ω' )
        .replace( /ά/g, 'α' )
        .replace( /[ίϊΐ]/g, 'ι' )
        .replace( /ή/g, 'η' )
        .replace( /\n/g, ' ' )
        .replace( /á/g, 'a' )
        .replace( /é/g, 'e' )
        .replace( /í/g, 'i' )
        .replace( /ó/g, 'o' )
        .replace( /ú/g, 'u' )
        .replace( /ê/g, 'e' )
        .replace( /î/g, 'i' )
        .replace( /ô/g, 'o' )
        .replace( /è/g, 'e' )
        .replace( /ï/g, 'i' )
        .replace( /ü/g, 'u' )
        .replace( /ã/g, 'a' )
        .replace( /õ/g, 'o' )
        .replace( /ç/g, 'c' )
        .replace( /ì/g, 'i' );
}

var searchType = jQuery.fn.DataTable.ext.type.search;

searchType.string = function ( data ) {
    return ! data ?
        '' :
        typeof data === 'string' ?
            removeAccents( data ) :
            data;
};

searchType.html = function ( data ) {
    return ! data ?
        '' :
        typeof data === 'string' ?
            removeAccents( data.replace( /<.*?>/g, '' ) ) :
            data;
};

}());


