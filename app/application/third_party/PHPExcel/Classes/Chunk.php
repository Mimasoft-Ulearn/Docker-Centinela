<?php

require(dirname(__FILE__) . '/' . 'PHPExcel/Reader/IReadFilter.php');
//use PHPExcel\Reader\Reader\IReadFilter;

/**  Define a Read Filter class implementing IReadFilter  */
class Chunk implements PHPExcel_Reader_IReadFilter
{
    private $startRow = 0;

    private $endRow = 0;

    /**
     * Set the list of rows that we want to read.
     *
     * @param mixed $startRow
     * @param mixed $chunkSize
     */
    public function setRows($startRow, $chunkSize)
    {
        $this->startRow = $startRow;
        $this->endRow = $startRow + $chunkSize;
    }

    public function readCell($column, $row, $worksheetName = '')
    {
        //  Only read the heading row, and the rows that are configured in $this->_startRow and $this->_endRow
        if (($row == 1) || ($row >= $this->startRow && $row < $this->endRow)) {
            return true;
        }

        return false;
    }
}

?>