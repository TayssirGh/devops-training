import {APP_INITIALIZER, NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {HttpClientModule} from "@angular/common/http";
import {FormsModule} from "@angular/forms";
import {EnvLoaderService} from "./env-loader.service";
import { ComponentComponent } from './component/component.component';

@NgModule({
  declarations: [
    AppComponent,
    ComponentComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [
    {
      provide: APP_INITIALIZER,
      useFactory: (envLoaderService: EnvLoaderService) => () => envLoaderService.init(),
      deps: [EnvLoaderService],
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}
