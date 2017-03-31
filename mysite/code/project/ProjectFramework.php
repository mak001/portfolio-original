<?php 

class ProjectFramework extends ProjectUses {
    
    public function Link() {
        return $this->ProjectHolder()->FrameworkLink($this->URLSegment);
    }
    
    public function CssClass() {
        return 'frame-' . $this->URLSegment;
    }
    
}

?>