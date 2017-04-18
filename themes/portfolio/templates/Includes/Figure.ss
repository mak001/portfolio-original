<figure class="$Classes">
	<% with $Image.Image %>
		<img class="figure-img img-fluid mb-0 pb-2" src="$Link" alt="$ALT"  data-toggle="modal" data-target="#figure-modal-$Id">
	<% end_with %>
	<figcaption class="figure-caption">$Image.Caption</figcaption>
</figure>

<div class="modal fade figure-modal" id="figure-modal-$Id" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">$Image.Image.ALT</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<img src="$Image.Image.Link" alt="$Image.Image.ALT"/>
			</div>
		</div>
	</div>
</div>