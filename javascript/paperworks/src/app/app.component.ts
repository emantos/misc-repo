import { Component } from '@angular/core';

export class Agency {
  name: string;
  subgroup: string;
  link: string;
}

const AGENCIES: Agency[] = [
  { name: 'PAG-IBIG', subgroup: 'Housing Related Forms', link: '#' },
  { name: 'PAG-IBIG', subgroup: 'Provident Related Forms', link: '#' },
  { name: 'PAG-IBIG', subgroup: 'Other Forms', link: '#' }
];

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  title = 'app';
  agencies = AGENCIES;
  selectedAgency = AGENCIES[0];

  onSelect(agency : Agency): void {
    this.selectedAgency = agency;
  }
}
