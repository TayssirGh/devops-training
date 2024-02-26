import { TestBed } from '@angular/core/testing';

import { AppClientService } from './app-client.service';

describe('AppClientService', () => {
  let service: AppClientService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AppClientService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
