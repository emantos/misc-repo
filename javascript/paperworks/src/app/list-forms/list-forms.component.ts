import { Component, OnInit, Input } from '@angular/core';

import { ActivatedRoute, ParamMap } from '@angular/router';
import 'rxjs/add/operator/switchMap';

import { Agency } from '../model/agency'
import { Form } from '../model/form'
import { FormsService } from '../service/forms.service';

@Component({
  selector: 'app-list-forms',
  templateUrl: './list-forms.component.html',
  styleUrls: ['./list-forms.component.css'],
	providers: [FormsService]
})

export class ListFormsComponent implements OnInit {

  agency: Agency;

	forms: Form[];

  constructor(
    private formsService: FormsService,
    private route: ActivatedRoute
  ) { }

  ngOnInit() {
		this.route.paramMap
      .switchMap((params: ParamMap) => this.formsService.getAgency(params.get('agencyName'), decodeURI(params.get('subgroup'))))
      .subscribe(agency => {
        this.agency = agency;
        this.formsService.getForms().then(resultForms => this.forms = resultForms);
      });
  }

}
