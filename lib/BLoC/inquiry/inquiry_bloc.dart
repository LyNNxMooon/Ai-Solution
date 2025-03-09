import 'package:ai_solution/BLoC/inquiry/inquiry_events.dart';
import 'package:ai_solution/BLoC/inquiry/inquiry_states.dart';
import 'package:ai_solution/data/vos/country_vo.dart';
import 'package:ai_solution/data/vos/inquiry_vo.dart';
import 'package:ai_solution/data/vos/services_vo.dart';
import 'package:ai_solution/domain/inquiry_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvents, CountryStates> {
  final InquiryRepo inquiryRepo;

  CountryBloc({required this.inquiryRepo}) : super(CountryInitial()) {
    on<FetchCountry>(_onFetchCountry);
  }

  Future _onFetchCountry(
      FetchCountry event, Emitter<CountryStates> emit) async {
    try {
      emit(CountryLoading());
      final fetchedCountry = await inquiryRepo.fetchAllCountires();

      final countryNames = <String>[];
      for (CountryVO country in fetchedCountry) {
        countryNames.add(country.name);
      }
      final dropdownItems = countryNames.map((String country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Text(country),
        );
      }).toList();
      emit(CountryLoaded(dropdownItems));
    } catch (error) {
      emit(CountryError('$error'));
    }
  }
}

class SerivceBloc extends Bloc<ServiceEvents, ServiceStates> {
  final InquiryRepo inquiryRepo;

  SerivceBloc({required this.inquiryRepo}) : super(ServiceInitial()) {
    on<FetchServices>(_onFetchServices);

    on<FetchServicesByAdmin>(_onFetchServicesByAdmin);
  }

  Future _onFetchServicesByAdmin(
      FetchServicesByAdmin event, Emitter<ServiceStates> emit) async {
    try {
      emit(ServiceLoading());
      final fetchedServices = await inquiryRepo.fetchAllServices();

      final serviceNames = <String>[];
      for (ServicesVO service in fetchedServices) {
        serviceNames.add(service.name);
      }

      emit(ServicesLoadedByAdmin(serviceNames));
    } catch (error) {
      emit(ServiceError('$error'));
    }
  }

  Future _onFetchServices(
      FetchServices event, Emitter<ServiceStates> emit) async {
    try {
      emit(ServiceLoading());
      final fetchedServices = await inquiryRepo.fetchAllServices();

      final serviceNames = <String>[];
      for (ServicesVO service in fetchedServices) {
        serviceNames.add(service.name);
      }
      final dropdownItems = serviceNames.map((String service) {
        return DropdownMenuItem<String>(
          value: service,
          child: Text(service),
        );
      }).toList();
      emit(ServiceLoaded(dropdownItems));
    } catch (error) {
      emit(ServiceError('$error'));
    }
  }
}

class InquirySubmissionBloc
    extends Bloc<InquiryEvents, InquirySubmissionStates> {
  final InquiryRepo inquiryRepo;

  InquirySubmissionBloc({required this.inquiryRepo})
      : super(InquirySubmissionInitial()) {
    on<SubmitInquiry>(_onInquirySubmission);
  }

  Future<void> _onInquirySubmission(
      SubmitInquiry event, Emitter<InquirySubmissionStates> emit) async {
    try {
      emit(InquirySubmissionLoading());

      if (event.firstName.isEmpty ||
          event.lastName.isEmpty ||
          event.companyName.isEmpty ||
          event.country.isEmpty ||
          event.emailAddress.isEmpty ||
          event.jobTitle.isEmpty ||
          event.jobDetails.isEmpty) {
        emit(
            InquirySubmissionError("Fill into all fields to submit the form!"));
      } else {
        int id = DateTime.now().millisecondsSinceEpoch;
        final InquiryVO inquiryForm = InquiryVO(
            id: id,
            firstName: event.firstName,
            lastName: event.lastName,
            emailAddress: event.emailAddress,
            companyName: event.companyName,
            country: event.country,
            service: event.service,
            jobTitle: event.jobTitle,
            jobDetails: event.jobDetails);
        await inquiryRepo.submitInquiry(inquiryForm).then(
          (value) {
            emit(InquirySubmitted("Your inquiry is successfully submitted!"));
          },
        );
      }
    } catch (error) {
      emit(InquirySubmissionError('$error'));
    }
  }
}
