import { Component} from '@angular/core';
import { Agency } from './model/agency'
import { FormsService } from './service/forms.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [FormsService]
})

export class AppComponent {
  agencies: Agency[];
  selectedAgency: Agency;

  constructor(private formsService: FormsService) { }

  onSelect(agency : Agency): void {
    this.selectedAgency = agency;
  }

  ngOnInit() {
		this.formsService.getAgencies().then(resultAgencies => {
      this.agencies = resultAgencies
      this.selectedAgency = this.agencies[0];
    });
  }
}
