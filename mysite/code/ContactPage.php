<?php 

class ContactPage extends Page {
    
}

class ContactPage_Controller extends Page_Controller {
    
    public function ContactForm() {
        $form = Form::create(
            $this,
            __FUNCTION__,
            FieldList::create(
                EmailField::create('Email', 'Email*'),
                TextField::create('Name', 'Name*'),
                TextField::create('Company', 'Company (optional)'),
                TextareaField::create('Message', 'Message*')
            ),
            FieldList::create(
                FormAction::create('handleContact', 'Submit')
            ),
            RequiredFields::create('Email', 'Name', 'Message')
        );
        
        return $form;
    }
    
}

?>