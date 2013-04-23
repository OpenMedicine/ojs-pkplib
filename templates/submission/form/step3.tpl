{**
 * templates/submission/form/step3.tpl
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 3 of author submission.
 *}
<script type="text/javascript">
	$(function() {ldelim}
		// Attach the JS form handler.
		$('#submitStep3Form').pkpHandler(
			'$.pkp.pages.submission.SubmissionStep3FormHandler',
			{ldelim}
				isEditedVolume: {if $isEditedVolume}true{else}false{/if},
				chaptersGridContainer: 'chaptersGridContainer',
				authorsGridContainer: 'authorsGridContainer'
			{rdelim});
	{rdelim});
</script>

<form class="pkp_form" id="submitStep3Form" method="post" action="{url op="saveStep" path=$submitStep}">
	<input type="hidden" name="submissionId" value="{$submissionId|escape}" />
	{include file="controllers/notification/inPlaceNotification.tpl" notificationId="submitStep3FormNotification"}

	{include file="core:submission/submissionMetadataFormTitleFields.tpl"}

	{fbvFormArea id="contributors"}
		<!--  Contributors -->
		{url|assign:authorGridUrl router=$smarty.const.ROUTE_COMPONENT component="grid.users.author.AuthorGridHandler" op="fetchGrid" submissionId=$submissionId}
		{load_url_in_div id="authorsGridContainer" url="$authorGridUrl"}

		{$additionalContributorsFields}
	{/fbvFormArea}

	{$additionalFormFields}

	{include file="core:submission/submissionMetadataFormFields.tpl"}

	{fbvFormButtons id="step3Buttons" submitText="submission.submit.finishSubmission" confirmSubmit="submission.confirmSubmit"}
</form>