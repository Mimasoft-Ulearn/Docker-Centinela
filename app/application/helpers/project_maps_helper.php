<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Project Maps Helper
 * Maneja el embebido de mapas en html forma escalable y mantenible.
 */

if (!function_exists('get_project_map_config')) {
    /**
     * Obtener configuracion de mapa por proyecto
     *
     * @param int $project_id Identificador de proyecto
     * @return array|null Configuracion de mapa o null en caso de no encontrarlo
     */
    function get_project_map_config($project_id)
    {
        // Map configurations for different projects
        $map_configs = [
            1 => [
                'file' => 'project_1_map.html',
                'title' => 'Mapa PLANTA OXE',
                'description' => 'Referencia ubicación de estaciones '
            ],
            2 => [
                'file' => 'project_2_map.html',
                'title' => 'Mapa PLANTA MET',
                'description' => 'Referencia ubicación de estaciones '
            ],
            3 => [
                'file' => 'project_3_map.html',
                'title' => 'Mapa PLANTA SÚLFUROS',
                'description' => 'Referencia ubicación de estaciones '
            ]
        ];

        return isset($map_configs[$project_id]) ? $map_configs[$project_id] : null;
    }
}

if (!function_exists('render_project_map')) {
    /**
     * Renderizado de mapa por proyecto
     *
     * @param int $project_id Identificador de proyecto
     * @return string HTML para embebido de mapa o string nullo en caso de no encontrarlo
     */
    function render_project_map($project_id)
    {
        $CI =& get_instance();
        $config = get_project_map_config($project_id);

        if (!$config) {
            return '';
        }

        // Creamos la url para los iframes
        $map_url = base_url('assets/maps/'. $config['file']);

        // Creamos el html que se renderiza en la vista
        $html = '<div class="project-map-container mb20">';
        $html .= '<div class="panel panel-default">';
        $html .= '<div class="panel-heading">';
        $html .= '<h4 class="panel-title">' . htmlspecialchars($config['title']) . '</h4>';
        $html .= '</div>';
        $html .= '<div class="panel-body p0">';
        $html .= '<div class="map-responsive">';
        // Implementamos el iframe con algunas medidas de seguridad
        $html .= sprintf(
            '<iframe src="%s" frameborder="0" class="project-map-iframe" sandbox="allow-scripts allow-same-origin" loading="lazy" title="%s"></iframe>',
            htmlspecialchars($map_url),
            htmlspecialchars($config['title'])
        );
        $html .= '</div>';
        $html .= '<div class="map-description p10">';
        $html .= '<small class="text-muted">' . htmlspecialchars($config['description']) . '</small>';
        $html .= '</div>';
        $html .= '</div>';
        $html .= '</div>';
        $html .= '</div>';

        return $html;
    }
}